package Algorithms;
/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 28.02.13
 * Time: 17:51
 * To change this template use File | Settings | File Templates.
 */
/**
 * 3-Sum
 * Сколько в списке троек, дающих в сумме 0?
 */
public class ThreeSum {
    public static int count(int[] a) {
        int N = a.length;
        int count = 0;
        for (int i = 0; i < N; i++)
            for (int j = i + 1; j < N; j++)
                for (int k = j + 1; k < N; k++)
                    if (a[i] + a[j] + a[k] == 0) count++;
        return count;
    }
}
