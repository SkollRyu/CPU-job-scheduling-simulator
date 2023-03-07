import java.util.*;

/**
 * Feedback Round Robin Scheduler
 * 
 * @version 2017
 */
public class FeedbackRRScheduler extends AbstractScheduler {

  // TODO - Different queue with increasing time quantum
  // When a task cannot be solved in first queue,
  // it pass to second queue
  // In each queue, it schedule according to priority

  // n-layer queue in ready-queue
  // or just different queue (L1, L2, L3, L4) - then how can we scale the range of priority?

  // we can use set priority to demote or upgrade the process
  List<Queue<Process>> multiLevelQueue;

  public FeedbackRRScheduler(){
    multiLevelQueue = new ArrayList<>();
  }


  /**
   * Adds a process to the ready queue.
   * usedFullTimeQuantum is true if process is being moved to ready
   * after having fully used its time quantum.
   */
  public void ready(Process process, boolean usedFullTimeQuantum) {
    // TODO


  }

  /**
   * Removes the next process to be run from the ready queue 
   * and returns it. 
   * Returns null if there is no process to run.
   */
  public Process schedule() {

    // TODO - A for-loop to check from higher queue to lower queue
    Process processToBeExecuted = null;
    for (Queue<Process> q : multiLevelQueue){
      if (!q.isEmpty()){
        processToBeExecuted = q.poll();
        break;
      }
    }
    return processToBeExecuted;
  }
}
