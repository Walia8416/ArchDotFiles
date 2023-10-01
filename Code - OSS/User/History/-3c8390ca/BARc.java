import edu.princeton.cs.algs4.StdRandom;
import edu.princeton.cs.algs4.StdStats;
import edu.princeton.cs.algs4.WeightedQuickUnionUF;

public class Percolation{
	private WeightedQuickUnionUF qf;
	private int top=0;
	private boolean[][] opened;
	private int bottom;
	private int openSites;
	private int n;


	public Percolation(int n){
		if(n<=0){
			throw new IllegalArgumentException();
		}
		this.n = n;
		bottom = (this.n*this.n) + 1;
		openSites=0;
		qf = new WeightedQuickUnionUF(n*n+2);
		opened = new boolean[n][n];

	}
		
	private int getIndex(int row,int col){
		return (n*(row-1))+col;
	}
	public void open(int row,int col){
		checkException(row,col);
		opened[row-1][col-1] = true; 
		openSites++;

		if(row==1){
			qf.union(getIndex(row,col),top);
		}

		if(row==n){
			qf.union(getIndex(row,col),bottom);
		}

		if(row > 1 && isOpen(row-1,col)){
			qf.union(getIndex(row,col),getIndex(row-1,col));
		}

		if(row<n && isOpen(row+1,col)){
			qf.union(getIndex(row,col),getIndex(row+1,col));
		}

		if(col > 1 && isOpen(row,col-1)){
			qf.union(getIndex(row,col),getIndex(row,col-1));
		}

		if(col < n && isOpen(row,col+1)){
			qf.union(getIndex(row,col),getIndex(row,col+1));
		}
	}

	private void checkException(int row, int col) {
        if (row <= 0 || row > n || col <= 0 || col > n) {
            throw new IllegalArgumentException();
        }
    }

	public boolean isOpen(int row,int col){
		checkException(row, col);
		return opened[row-1][col-1];
	}
	public int numberOfOpenSites() {
        return openSites;
    }

	public boolean isFull(int row,int col){
		if ((row > 0 && row <= n) && (col > 0 && col <= n)) {
			return qf.find(top) == qf.find(getIndex(row,col));
		}else {throw new IllegalArgumentException();}
	}

	public boolean percolates(){
		return qf.find(top) == qf.find(bottom);
	}

	




}