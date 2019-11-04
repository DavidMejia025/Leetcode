class Solution {
    public boolean isPalindrome(int x) {
        if(x < 0)         return false;
        if(x < 10)        return true;
        if((x % 10) == 0) return false;
        /*
        if((x < 0) || ((x % 10) == 0) && (x != 0)) return false;
        
        if(x < 10) return true;
        */
        
        int div;
        int mod;
        int newNum  = 0;
        int intHalf = x / 2;
        
        while(x > newNum){            
            mod = x % 10;
            
            newNum = newNum * 10 + mod;
            x      = x /10;
        }

        if (x == newNum) return true;

        if (newNum >= 10) newNum = newNum / 10;
        
        if (x == newNum) return true;
        
        return false;
    }
}
