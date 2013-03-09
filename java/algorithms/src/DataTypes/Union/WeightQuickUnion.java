package DataTypes.Union;

import java.util.Arrays;

/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 17.02.13
 * Time: 16:41
 * To change this template use File | Settings | File Templates.
 */
public class WeightQuickUnion implements Union {
    protected int[] id;
    protected int[] sz;

    public WeightQuickUnion(int n) {
        id = new int[n];
        sz = new int[n];
        for (int i = 0; i < n; i++) {
            id[i] = i;
            sz[i] = 1;
        }
    }

    protected int root(int q) {
        while (q != id[q]) q = id [q];
        return q;
    }

    public boolean connected(int p, int q) {
        return root(p) == root(q);
    }

    public void union(int p, int q) {
        int i = root(p);
        int j = root(q);

        if (sz[i] < sz[j]) { id[i] = j; sz[j] += sz[i]; }
        else               { id[j] = i; sz[i] += sz[j]; }
    }

    public String getUnion() {
        return Arrays.toString(id);
    }
}
