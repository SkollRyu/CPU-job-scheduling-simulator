import java.util.PriorityQueue;
import java.util.Properties;

/**
 * Shortest Job First Scheduler
 * 
 * @version 2017
 */
public class SJFScheduler extends AbstractScheduler {

  // TODO - predict(n+1) = (1/2)(Actual Current Burst time) + (1 - 1/2)(predicted current burst time)
  // Don't use getNextBurst(), cuz you can't predict the future
  private PriorityQueue<Process> readyQueue = new PriorityQueue<>((p1, p2) -> (estimatingNextBurst(p1) - estimatingNextBurst(p2)));
  private double alphaBurstEstimate;
  private int initialBurstEstimate;
  @Override
  public void initialize(Properties parameters) {
    super.initialize(parameters);
    this.alphaBurstEstimate = Double.parseDouble(parameters.getProperty("alphaBurstEstimate"));
    this.initialBurstEstimate = Integer.parseInt(parameters.getProperty("initialBurstEstimate"));
  }

  public int estimatingNextBurst(Process process){
    int guess = (int) ((process.getRecentBurst() * alphaBurstEstimate) + (1 - alphaBurstEstimate)*initialBurstEstimate);
    initialBurstEstimate = guess;
    System.out.println(guess);
    return guess;
  }
  /**
   * Adds a process to the ready queue.
   * usedFullTimeQuantum is true if process is being moved to ready
   * after having fully used its time quantum.
   */
  public void ready(Process process, boolean usedFullTimeQuantum) {
    // TODO
    readyQueue.offer(process);
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
