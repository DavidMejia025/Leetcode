/*
 * Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

    example:
      n = 2, r = 2
      n = 3, r = 5
      n=  4, r = 14

PseudoCode:

1 do build binary tree for each element x from 1 to n starting with y != x

There is some kind of recursion or memoization where you need to build a tree of y < x.
*/


class Solution {
    public int numTrees(int n) {

    }

    public int numTreesImp(int num, int[] memo){
        if (n == 1){
            return 1;
        }

        int total = 0;

        System.out.println(arraysToString(memo));

        for (int i = 1; i <= n; i++){
           total += calculateCurrentTotal(i, n);
        }

        return total;
    }

    public int calculateCurrentTotal(int i, int n){
        int left  = i - 1;
        int right = n - i;

        int total_left  = left  == 0 ? 1 : numTrees(left);
        int total_right = right == 0 ? 1 : numTrees(right);

        return total_left * total_right;
    }
}




