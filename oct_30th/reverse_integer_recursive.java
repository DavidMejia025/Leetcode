/* Input: 123
 *
 * output: 321
 *
*/
class Solution {
    public int reverse(int x) {
        System.out.println(Math.pow(2, 31));
      int exponent = find_exponent(x,0);
        System.out.println(exponent);

        double result = divide_by_10((double) x, exponent);
        
        if ((result > 2147483647) || (result < -2147483644)) return 0;
        
        return (int) result;
    }
    
    private double divide_by_10(double y, int exponent) {
        int division = (int) y / 10;
        int mod      = (int) y % 10;
        
        if (division == 0){
            double  result =  y * Math.pow(10, exponent);
            
            return result;
        } 
        
        return divide_by_10(division, exponent - 1) + (mod * Math.pow(10, exponent));
    }
    
    private int find_exponent(int x, int exponent){
        if (x / 10 == 0) return exponent;
        
        x = x/10;
        
        return find_exponent(x, exponent + 1);
    }
}
