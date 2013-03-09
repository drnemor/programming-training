package Algorithms;

/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 08.03.13
 * Time: 17:18
 * To change this template use File | Settings | File Templates.
 */
public class BinarySearch {
    public static int binartSearch(int[] a, int key) {
        int low = 0;
        int high = a.length;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            if      (key < a[mid]) high = mid - 1;
            else if (key > a[mid]) low = mid + 1;
            else return mid;
        }

        return -1;
    }
}
