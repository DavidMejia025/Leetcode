class Solution {
    public void setZeroes(int[][] matrix) {
        int m = matrix.length;
        int n = matrix[0].length;

        for (int i = 0; i < m; i++){
            for (int j = 0; j < n; j++){
                if (matrix[i][j] == 0){
                    row_to_zero(i, matrix);
                    column_to_zero(m, j, matrix);
                }

            }
        }

         for (int i = 0; i < m; i++){
            for (int j = 0; j < n; j++){
                if (matrix[i][j] == -100000000){
                    matrix[i][j] = 0;
                }
            }
         }
    }


     public static void row_to_zero(int row, int [][] matrix) {
        for (int i = 0; i < matrix[row].length; i++){
             if (matrix[row][i] != 0){
                 matrix[row][i] = -100000000;
             }
         }
    }

    public static void column_to_zero(int row, int column, int [][] matrix) {
        for (int i = 0; i < row; i++){
             if (matrix[i][column] != 0){
                 matrix[i][column] = -100000000;
             }
         }
    }

  }
