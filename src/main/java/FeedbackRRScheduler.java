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
  // for each level: we have different time quantum, how can we achieve that?

  // we can use set priority to demote or upgrade the process
  PriorityQueue<Process> readyQueue = new PriorityQueue<>();
  private int timeQuantum;
  public FeedbackRRScheduler(){
    readyQueue = new PriorityQueue<>((p1, p2) -> p1.getPriority() - p2.getPriority());
  }

  @Override
  public void initialize(Properties parameters) {
    super.initialize(parameters);
    this.timeQuantum = Integer.parseInt(parameters.getProperty("timeQuantum"));
  }

  @Override
  public int getTimeQuantum() {
    return timeQuantum;
  }

  @Override
  public boolean isPreemptive() {
    return true;
  }


  /**
   * Adds a process to the ready queue.
   * usedFullTimeQuantum is true if process is being moved to ready
   * after having fully used its time quantum.
   */
  public void ready(Process process, boolean usedFullTimeQuantum) {
    // TODO
    if (usedFullTimeQuantum){
      // demote it
      process.setPriority(process.priority + 1);
    }
    readyQueue.offer(process);
  }

  /**
   * Removes the next process to be run from the ready queue 
   * and returns it. 
   * Returns null if there is no process to run.
   */
  public Process schedule() {
    if (!readyQueue.isEmpty()){
      System.out.println("Scheduler selects process "+readyQueue.peek());
      return readyQueue.poll();
    }
    return null;
  }
}
