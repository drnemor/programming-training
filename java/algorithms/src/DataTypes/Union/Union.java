package DataTypes.Union;

/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 17.02.13
 * Time: 16:31
 * To change this template use File | Settings | File Templates.
 */
public interface Union {
    public void    union(int p, int q);
    public boolean connected(int p, int q);
    public String getUnion();
}
