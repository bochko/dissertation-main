#include <iostream>
#include <unistd.h>
#include <csignal>
#include <wait.h>
#include <fstream>
#include "ansic_log.h"

#define FSYSCOORD_ID        0x00
#define FSYSNOTIFY_ID       0x01
#define FSYSINFORMER_ID     0x02
#define RESTART_COND_INIT   0x00
#define RESTART_COND_TERM   0x01
#define WAITPID_ANYCHILD    (-1)

typedef struct {
    pid_t pid;
    std::string execp;
} hproc_t;

typedef struct {
    int pipein;
    int pipeout;
} hpipe_t;

typedef struct {
    std::string fsysnotify_exec;
    std::string fsysinformer_exec;
    bool debug;
} fsysconf_t;

typedef struct {
    int id = -1;
    hpipe_t pipe;
} proc_metadata_t;

int open_shared_fifo(hpipe_t *pipe_handle);
int discard_shared_fifo(hpipe_t *pipe_handle);
int fork_and_assign_to_handle(hproc_t *proc_handle);
int start_process(std::string bin_path, char **args);
int terminate_process(hproc_t *proc_handle);
void block_until_death(void);
int check_conf_file(const char *path);
int create_conf_file(const char *path);
int read_conf_file(fsysconf_t *conf);
proc_metadata_t kill_exec_restart(int condition, hpipe_t *pipe, hproc_t *fsys_notify, hproc_t *fsys_informer, char **argv);


int open_shared_fifo(hpipe_t *pipe_handle) {
    int pipefd[2];
    int res = pipe(pipefd);
    if (!res) {
        std::cout << "created pipe" << std::endl;
        /* populate handle */
        pipe_handle->pipein = pipefd[0];
        pipe_handle->pipeout = pipefd[1];
        return 1;
    } else {
        std::cout << "failed to create a pipe" << std::endl;
        return 0;
    }
}

int discard_shared_fifo(hpipe_t *pipe_handle) {
    /* close file entries associated with fd's */
    int res = close(pipe_handle->pipein);
    if (res) return 0;
    res = close(pipe_handle->pipeout);
    if (res) return 0;
    pipe_handle->pipein = 0;
    pipe_handle->pipeout = 0;
    return 1;
}

int fork_and_assign_to_handle(hproc_t *proc_handle) {
    if (proc_handle->pid != 0) {
        /* process has already been assigned pid, hence has started */
        return 0;
    } else {
        proc_handle->pid = fork();
        if (proc_handle->pid < 0) {
            return 0;
        }
        return 1;
    }
}

int start_process(std::string bin_path, char **args) {
    execv(bin_path.c_str(), args);
}

int terminate_process(hproc_t *proc_handle) {
    /* cannot kill self or non-running process */
    int res = kill(proc_handle->pid, SIGKILL);
    proc_handle->pid = 0;
    if (!res) {
        /* success */
        return 1;
    } else return 0;
}

void block_until_death(void) {
    waitpid(WAITPID_ANYCHILD, NULL, 0);
}

proc_metadata_t restart_id;

int main(int argc, char **argv) {
//    if (argc == 1) {
//        /* if only exec name passed as argument, check
//         * for default configuration file */
//        struct stat buffer;
//        int conf_status = stat("fsyscoord.conf", &buffer);
//        /* if config file doesn't exist, create a template one and exit */
//        if(conf_status != 0) {
//            std::ofstream fil;
//            fil.open("fsyscoord.conf", std::ofstream::out | std::ofstream::in);
//            fil.close();
//            std::cout << "Please populate template fsyscoord.conf and try again" << std::endl;
//        }
//    }
//    else if(argc != 3) {
//        std::cout << "./fsyscoord [~/path/to/fsysnotify] [~/path/to/fsysinformer]" << std::endl;
//        exit(EXIT_FAILURE);
//    }
    ansic_log(LOG_DEBUG, "FSysCoordinator :: Started. Attempting to spawn children...");
    hproc_t fsysnotify;
    fsysnotify.execp = std::string("/home/boyan/Dissertation/dissertation-main/bin/fsysnotify");
    hproc_t fsysinformer;
    fsysinformer.execp = std::string("/home/boyan/Dissertation/dissertation-main/bin/fsysnotify");
    hpipe_t common_pipe;

    restart_id = kill_exec_restart(RESTART_COND_INIT, &common_pipe, &fsysnotify, &fsysinformer, argv);
    switch (restart_id.id) {
        case FSYSCOORD_ID:
            ansic_log(LOG_DEBUG, "FSysCoordinator :: Returned from restart. Entering FSysCoordinator logic");
            /* block until one of the children has exited */
            block_until_death();
            break;
        case FSYSNOTIFY_ID:
            ansic_log(LOG_DEBUG, "FSysCoordinator :: Returned from restart. Entering FSysNotify logic");
            /*if (start_process(fsysnotify.execp, NULL)) {
                std::cout << "Problem with execution of " << fsysnotify.execp << std::endl;
            }*/
            break;
        case FSYSINFORMER_ID:
            ansic_log(LOG_DEBUG, "FsysCoordinator :: Returned from restart. Entering FSysInformer logic");
             /*if (start_process(fsysinformer.execp, NULL)) {
                std::cout << "Problem with execution of " << fsysinformer.execp << std::endl;
            }*/
            break;
        default:
            ansic_log(LOG_ERROR, "FsysCoordinator :: Returned from restart. Received nonsense. Restarting everything...");
            std::cout << "We messed up boys. RESTART_ID returned with something wonky." << std::endl;
            break;
    }
    kill_exec_restart(RESTART_COND_INIT, &common_pipe, &fsysnotify, &fsysinformer, argv);
}

proc_metadata_t
kill_exec_restart(int condition, hpipe_t *pipe, hproc_t *fsys_notify, hproc_t *fsys_informer, char **argv) {
    ansic_log(LOG_DEBUG, "FsysCoordinator :: Entered restart routine");
    /** close the pipe */
    discard_shared_fifo(pipe);
    /**
     * kill remaining children processes, or furhter invalidate
     * children process ID's (PIDs)
     */
    terminate_process(fsys_notify);
    terminate_process(fsys_informer);

    if (condition == RESTART_COND_TERM) {
        /* if condition is to re-run the whole coordinator process,
         * replace stack and instructions with THIS executable */
        execv("exec*()", argv);
    } else if (condition == RESTART_COND_INIT) {
        /* if condition is to restart the child processes,
         * close the shared pipe, open a new one, and after
         * forking some processes determine
         * which fork is which */
        proc_metadata_t metadata;
        open_shared_fifo(pipe);
        metadata.pipe.pipein = pipe->pipein;
        metadata.pipe.pipeout = pipe->pipeout;

        /** start fsysnotify */
        fork_and_assign_to_handle(fsys_notify);
        if (fsys_notify->pid == 0) {
            ansic_log(LOG_DEBUG, "FSysCoordinator :: FSysNotify successfuly forked");
            metadata.id = FSYSNOTIFY_ID;
            return metadata;
        } else {
            /* we are in the parent */
            std::cout << "COORD:: The new PID for FSysNotify is: " << (int) fsys_notify->pid << std::endl;
            fork_and_assign_to_handle(fsys_informer);
            if (fsys_informer->pid == 0) {
                /* we are in the fsysinformer process */
                ansic_log(LOG_DEBUG, "FsysCoordinator :: FsysInformer successfuly forked");
                metadata.id = FSYSINFORMER_ID;
                return metadata;
            } else {
                std::cout << "COORD:: The new PID for FSysInformer is: " << (int) fsys_informer->pid << std::endl;
            }
        }
        metadata.id = FSYSCOORD_ID;
        return metadata;
    }
}