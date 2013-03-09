package DataTypes.Union;

import java.util.Arrays;

/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 17.02.13
 * Time: 16:35
 * To change this template use File | Settings | File Templates.
 */
public class QuickUnion implements Union {
    protected  int[] id;

    public QuickUnion(int n) {
        id = new int[n];
        for (int i = 0; i < n; i++)
            id[i] = i;
    }

    protected int root(int i) {
        while (i != id[i]) i = id[i];
        return i;
    }

    public boolean connected(int p, int q) {
        return root(q) == root(p);
    }

    public void union(int p, int q) {
        int i = root(p);
        int j = root(q);
        id[i] = j;
    }

    public String getUnion() {
        return Arrays.toString(id);
    }
}
