//94. Binary Tree Inorder Traversal

//Given a binary tree, return the inorder traversal of its nodes' values

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> result  = new ArrayList<Integer>();

        if (!(root == null)){
            TreeNode node = root;

            process(node, result);
        }

        return  result;
    }

    public void process(TreeNode node, List<Integer> result) {
        if ((node.left == null) && (node.right == null)){
            System.out.println(result);
            result.add(node.val);
        } else {
            if(node.left != null){
                process(node.left, result);
            }

            result.add(node.val);

            if (node.right != null) {
                process(node.right, result);
            }
        }
    }
}
