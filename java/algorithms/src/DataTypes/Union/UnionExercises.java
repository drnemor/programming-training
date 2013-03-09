package DataTypes.Union;

/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 17.02.13
 * Time: 18:20
 * To change this template use File | Settings | File Templates.
 */
public class UnionExercises {
    public static void question1() {
        QuickFind a = new QuickFind(10);

        a.union(5,4);
        a.union(5,8);
        a.union(3,2);
        a.union(9,1);
        a.union(6,0);
        a.union(5,6);

        System.out.println(a.getUnion());
    }

    public static void question2() {
        WeightQuickUnion a = new WeightQuickUnion(10);

        a.union(3,1);
        a.union(4,2);
        a.union(1,6);
        a.union(7,9);
        a.union(4,7);
        a.union(8,6);
        a.union(1,9);
        a.union(8,5);
        a.union(6,0);

        System.out.println(a.getUnion());
    }
}
