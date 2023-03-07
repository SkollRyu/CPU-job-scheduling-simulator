# CPU Scheduler
A discrete event simulator to conduct experiments on different processor loads 
and schedulers, and analyse the results to determine in which situations each 
scheduling algorithm works most efficiently.

## How to run it
- [ ] Bash Script / python script to run all schedulers in one experiment
  - a script to automatically reproduce the files in output/ from the files in input/ 
    and corresponding parameters.prp files for each experiment
- [ ] A python script to extract all the output.out and plot it with a graph

## AIM
To investigate the performance of different CPU scheduling algorithms.

### Implementation
Performance Metrics
- [x] Turnaround time [3/9]
- [x] Waiting time [3/9]
- [x] Response time [3/9]

Scheduling Algorithm
- [x] FCFS
- [ ] Round Robin [8/46]
- [ ] Ideal Shortest Job First [10/46]
- [ ] Multi-level feedback queue with Round Robin [13/46]
- [ ] Shortest Job First using exponential averaging [15/46]

### Experiments
- Experiment 1 [13/45]
- Scope and objectives well-defined [4/13]
- Parameters and setup explained [3/13]
- Results visualised [3/13]
- Results discussed [3/13]

Experiment 2 [13/45]
- Scope and objectives well-defined [4/13]
- Parameters and setup explained [3/13]
- Results visualised [3/13]
- Results discussed [3/13]

Experiment 3 [13/45]
- Scope and objectives well-defined [4/13]
- Parameters and setup explained [3/13]
- Results visualised [3/13]
- Results discussed [3/13]

## Parameters
### Input_generator
- numberOfProcesses: number of processes
- staticPriority: priority for each process
- meanInterArrival: the interval of arrival time
- meanCpuBurst: CPU burst time
- meanIOBurstL: IO burst time -> if it is not 0, a process will need to wait
- meanNumberBursts: tbc
- seed: seed

### Scheduler
- scheduler: FcfsScheduler, RRScheduler, IdealSJFScheduler, FeedbackRRScheduler, SJFScheduler
- timeLimit: tbc
- periodic: tbc
- interruptTime: tbc
- timeQuantum: the time that RRScheduler assign for each process, usually around 20 - 50ms
- initialBurstEstimate: tbc
- alphaBurstEstimate: tbc