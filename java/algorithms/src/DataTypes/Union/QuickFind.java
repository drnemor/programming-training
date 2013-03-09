package DataTypes.Union;

import java.util.Arrays;
/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 14.02.13
 * Time: 18:49
 * To change this template use File | Settings | File Templates.
 */
public class QuickFind implements Union {
    protected  int[] id;

    public QuickFind(int n) {
        id = new int[n];
        for (int i = 0; i < n; i++)
            id[i] = i;
    }

    public void union(int p, int q) {
        int pId = id[p];
        int qId = id[q];

        for (int i = 0; i < id.length; i++)
            if (id[i] == pId) {
                id[i] = qId;
            }
    }

    public boolean  connected(int p, int q) {
        return id[p] == id[q];
    }

    public String getUnion() {
        return Arrays.toString(id);
    }
}
