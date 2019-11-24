class Solution {
    public int numTrees(int n) {
        if (n <= 1){
          return 1;
        }

        int total = 0;


        for (int i = 1; i <= n; i++){
            int left  = i - 1;
            int right = n - i;

            int total_right =  numTrees(left);
            int total_left  =  numTrees(right);

            total += total_left * total_right;
        }

        return total;
    }
}
