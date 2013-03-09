package DataTypes.Union;

/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 17.02.13
 * Time: 17:28
 * To change this template use File | Settings | File Templates.
 */
public class WightQuickUnionPath extends WeightQuickUnion {
    public WightQuickUnionPath(int n) {
        super(n);
    }

    @Override
    protected int root(int q) {
        while (q != id[q]) {
            id[q] = id[id[q]];
            q = id[q];
        }
        return q;
    }
}
