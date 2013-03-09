/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 14.02.13
 * Time: 18:48
 * To change this template use File | Settings | File Templates.
 */
import Algorithms.ThreeSum;
public class PercolationStats {
    public static void main(String[] args) {
        int[] array = {30, -40, -20, -10, 40, 0, 10, 5};
        Stopwatch stopwatch = new Stopwatch();
        int test  = ThreeSum.count(array);
        double time = stopwatch.elapsedTime();
        System.out.print("Three sum = " + test);
    }
}
