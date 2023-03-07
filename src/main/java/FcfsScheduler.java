import java.util.Queue;
import java.util.LinkedList;

/**
 * First-Come First-Served Scheduler
 * 
 * @author Peter Schrammel
 * @version 2017
 */
public class FcfsScheduler extends AbstractScheduler {

  private Queue<Process> readyQueue;

 /**
   * Creates an instance of the FCFS scheduler
   */
  public FcfsScheduler() {
    readyQueue = new LinkedList<Process>();
  }

  /**
   * Adds a process to the ready queue.
   */
  public void ready(Process process, boolean usedFullTimeQuantum) {
      // offer(E e) = adds the specified element as the tail (last element) of this list
    readyQueue.offer(process);
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
    System.out.println("Scheduler selects process "+readyQueue.peek());
    return readyQueue.poll();
    // returns the first element of this list, or null if this list is empty.
  }
}
