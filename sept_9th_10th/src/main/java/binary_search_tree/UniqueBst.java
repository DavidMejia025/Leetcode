package binary_search_tree;

import binary_search_tree.BstNode;

public class UniqueBst {
	public static void main(String[] args) {
	   BstNode bST = new BstNode(2);
	   
	   bST.addChild(10);
	   bST.addChild(-10);
	   
	   long right = bST.getRight();
	   long left = bST.getLeft();
	   
	   System.out.println(bST.getRoot());
	   System.out.println(right);
	   System.out.println(left);
	}
}


