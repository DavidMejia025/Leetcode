package binary_search_tree;

public class BstNode {
    private int  root;
    private long  left;
    private long  right;

    public BstNode(int root) {
        this.root  = root;
        this.left  = -10000;
        this.right =  10000; 
    }

    public long getRoot() {
        return root;
    }
    public long getLeft() {
        return left;
    }
    public long getRight() {
        return right;
    }
    public void setRoot(long num) {
        this.root = num;
    }
    
    public void addChild(long num) {
    	if (num <= this.root) {
    	  this.left = num;
    	} else{
    	  this.right = num;	  
    	}
    }
}
		   
