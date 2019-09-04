#Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.
# brute force
class Solution {
    public void setZeroes(int[][] matrix) {
        int m = matrix.length;
        int n = matrix[0].length;
        int rows[] = new int[m*n];
        Arrays.fill(rows, -1);
        int cols[] = new int[m*n];
        Arrays.fill(cols, -1);
        int k_rows = 0;
        int k_cols = 0;

        for (int i = 0; i < m; i++){
            for (int j = 0; j < n; j++){
                if (matrix[i][j] == 0){
                    rows[k_rows] = i;
                    cols[k_cols] = j;
                    k_cols += 1;
                    k_rows += 1;
                }

            }
        }
         for (int j = 0; j < rows.length; j++){
             if (rows[j] != -1){
                 Solution.row_to_zero(rows[j], matrix);
             }
         }
         for (int j = 0; j < cols.length; j++){
             if (cols[j] != -1){
                 Solution.column_to_zero(m, cols[j], matrix);
             }
         }
    }

    public static void row_to_zero(int row, int [][] matrix) {
         for (int i = 0; i < matrix[row].length; i++){
            matrix[row][i] = 0;
         }
    }

    public static void column_to_zero(int row, int column, int [][] matrix) {
         for (int i = 0; i < row; i++){
            matrix[i][column] = 0;
         }
    }
}

//        System.out.println("columns");
//         for (int j = 0; j < cols.length; j++){
//           System.out.println(cols[j]);
//         }
//        System.out.println("rows");
//         for (int j = 0; j < rows.length; j++){
//           System.out.println(rows[j]);
//         }



















