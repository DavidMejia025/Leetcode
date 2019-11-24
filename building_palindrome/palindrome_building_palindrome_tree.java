class Solution {
    public boolean isPalindrome(int x) {
        if(x < 0) return false;
        
        int external; int internal;
        
        int exp = find_exponent(x, 0);
        
        int i = 0; int j = exp;
        
        while(i < exp){
            external = x / (1 * (int) Math.pow(10, exp));
            internal = (x % (1 * (int) Math.pow(10, i + 1)))  / (1 * (int) Math.pow(10, i));
            
            if (external != internal) return false;
            
            x = x % (1 * (int) Math.pow(10, exp));
            x = x - internal;
            i++;
            exp--;
        }
        
        return true;
    }
    
    private int find_exponent(int x, int exponent){
        if (x / 10 == 0) return exponent;
        
        x = x/10;
        
        return find_exponent(x, exponent + 1);
    }
}
