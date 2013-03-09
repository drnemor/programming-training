package Algorithms;

import DataTypes.Union.WeightQuickUnion;
/**
 * Created with IntelliJ IDEA.
 * User: DrNemor
 * Date: 26.02.13
 * Time: 19:15
 * To change this template use File | Settings | File Templates.
 */

enum SiteState {OPEN, BLOCKED, FULL};
public class Percolation {
    private SiteState[][] sites;
    private WeightQuickUnion union;
    private int gridSide;

    public Percolation(int N) {
        initSites(N);
        initUnion(N);
    }

    public void open(int i, int j) {
        if (i < 0 || i >= gridSide ||
            j < 0 || j >= gridSide)
            throw new java.lang.IndexOutOfBoundsException("Out of bounds in grid!");
        sites[i][j] = SiteState.OPEN;

        final int CURRENT_POS = gridSide * i + j;
        final int UP_TO_CURRENT_POS = CURRENT_POS - gridSide;
        final int DOWN_TO_CURRENT_POS = CURRENT_POS + gridSide;
        final int LEFT_TO_CURRENT_POS = CURRENT_POS - 1;
        final int RIGHT_TO_CURRENT_POS = CURRENT_POS + 1;

        if (i > 0) if (isOpen(i-1, j)) union.union(CURRENT_POS, UP_TO_CURRENT_POS);
        if (i < gridSide - 1) if (isOpen(i+1, j)) union.union(CURRENT_POS, DOWN_TO_CURRENT_POS);
        if (j > 0) if (isOpen(i, j-1)) union.union(CURRENT_POS, LEFT_TO_CURRENT_POS);
        if (j < gridSide - 1) if (isOpen(i, j+1)) union.union(CURRENT_POS, RIGHT_TO_CURRENT_POS);
    }

    public boolean  isOpen(int i, int j) {
        return sites[i][j] == SiteState.OPEN;
    }

    public boolean isFull(int i, int j) {
        return sites[i][j] == SiteState.FULL;
    }

    public boolean perlocates() {
        return union.connected(gridSide*gridSide, gridSide*gridSide + 1);
    }

    public void printSite() {
        for (int i = 0; i < gridSide; i++) {
            System.out.println();
            for (int j = 0; j < gridSide; j++) {
                switch (sites[i][j]) {
                    case BLOCKED: System.out.print("X "); break;
                    case OPEN: System.out.print("O "); break;
                    case FULL: System.out.print("~ "); break;
                }
            }
        }
    }

    protected void initSites(int N) {
        gridSide = N;
        sites = new SiteState[N][N];

        for (int i = 0; i < N; i++)
            for (int j = 0; j < N; j++) {
                sites[i][j] = SiteState.BLOCKED;
            }
    }

    protected void initUnion(int N) {
        final int GHOST_POINT_COUNT = 2;
        final int UPPER_GHOST_POINT = N*N;
        final int LOWER_GHOST_POINT = N*N + 1;
        union = new WeightQuickUnion(N*N + GHOST_POINT_COUNT);

        for (int i = 0; i < N; i++) {
            union.union(UPPER_GHOST_POINT, i);
            union.union(LOWER_GHOST_POINT, N*N-i-1);
        }
    }
}
