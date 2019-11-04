// Determine wether or not an integer is palindrome or not
//
class Solution {
    public boolean isPalindrome(int x) {
        if (x < 0) return false;
        
        int x_reverse = reverse(x);
        
        boolean result = (x_reverse == x) ? true : false;
        
        return result; 
    }
    
    private int reverse(int x) {
        int rev = 0;
        
        while (x != 0) {
            int pop = x % 10;
            System.out.println(pop);
            x /= 10;
            if (rev > Integer.MAX_VALUE/10 || (rev == Integer.MAX_VALUE / 10 && pop > 7)) return 0;
            if (rev < Integer.MIN_VALUE/10 || (rev == Integer.MIN_VALUE / 10 && pop < -8)) return 0;
            rev = rev * 10 + pop;
        }
        return rev;
    }
}
