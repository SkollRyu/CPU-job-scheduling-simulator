import java.util.LinkedList;
import java.util.Properties;
import java.util.Queue;

/**
 * Round Robin Scheduler
 * 
 * @version 2017
 */
public class RRScheduler extends AbstractScheduler {
  /**
   * it only interrupts a running process when a new
   * or previously blocked process appears in the ready queue,
   * not when the allocated time quantum is consumed by a process.
   */
  // TODO
  private LinkedList<Process> readyQueue;
  private int timeQuantum;

  @Override
  public void initialize(Properties parameters) {
    super.initialize(parameters);
    this.timeQuantum = Integer.parseInt(parameters.getProperty("timeQuantum"));
  }

  public RRScheduler(){
    readyQueue = new LinkedList<Process>();
  }

  @Override
  public int getTimeQuantum() {
    return timeQuantum;
  }

  /**
   * Adds a process to the ready queue.
   * usedFullTimeQuantum is true if process is being moved to ready
   * after having fully used its time quantum.
   */
  public void ready(Process process, boolean usedFullTimeQuantum) {
    // TODO - Don't know if this is right
    if (usedFullTimeQuantum) {
      readyQueue.offer(process);
    } else {
      readyQueue.offerFirst(process);
    }
  }

  /**
   * Removes the next process to be run from the ready queue 
   * and returns it. 
   * Returns null if there is no process to run.
   */
  public Process schedule() {
    // TODO - this should be right
    System.out.println("Scheduler selects process "+readyQueue.peek());
    return readyQueue.poll();
  }
}
