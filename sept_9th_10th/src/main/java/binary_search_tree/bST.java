package binary_search_tree;

import binary_search_tree.BstNode;

public class bST {
   private long root;
   private BstNode left  = new BstNode(0);
   private BstNode right = new BstNode(0);
   
   public bST(long num) {
	   this.root = num;
   }
   
   long getRoot() {
	   return this.root;
   }
   
   long getRight() {
	  return  this.right.getRoot();
   }
   
   long geLeft() {
	  return  this.left.getRoot();
   }
   
   void addChild(long num) {
	   if (num <= this.root) {
		   if (this.left.getRoot() == 0) {
			   this.left.setRoot(num);
		   } else {
			   this.left.addChild(num);
		   }
	   } else {
		   if (this.right.getRoot() == 0) {
			   this.right.setRoot(num);
		   } else {
			   this.right.addChild(num);
		   }
	   }
   }
}
