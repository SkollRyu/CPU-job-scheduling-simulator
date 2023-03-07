import java.util.Iterator;
import java.util.PriorityQueue;

/**
 * Ideal Shortest Job First Scheduler
 * 
 * @version 2017
 */
public class IdealSJFScheduler extends AbstractScheduler {

  // TODO - NOt sure if this is right, this is wrong
  PriorityQueue<Process> readyQueue = new PriorityQueue<Process>((p1, p2) -> p1.getNextBurst() - p2.getNextBurst());

  /**
   * Adds a process to the ready queue.
   * usedFullTimeQuantum is true if process is being moved to ready
   * after having fully used its time quantum.
   */
  public void ready(Process process, boolean usedFullTimeQuantum) {
    // TODO - Except case, if we only have 1 element in the queue
    // if they arrive at the same time, this process need to check next process?
    // how does the ready is called
    readyQueue.offer(process);
    System.out.println("Ready");
    System.out.println("Next Burst" + process.getNextBurst());
    for (Process p : readyQueue){
      System.out.println(p.id);
    }
  }

  /**
   * Removes the next process to be run from the ready queue 
   * and returns it. 
   * Returns null if there is no process to run.
   */
  public Process schedule() {
    // TODO
    System.out.println("Scheduler selects process "+readyQueue.peek());
    return readyQueue.poll();
  }
}
