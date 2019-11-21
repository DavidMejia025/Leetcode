class Solution {
    public boolean isPalindrome(String s) {
        if (s.equals("")) return true;
        
        String[] sArray = s.toLowerCase().split("");
        
        int i = 0; int j = (sArray.length) - 1;
        
        while (i < j){
            if ((isLetter(sArray[i])) && ((isLetter(sArray[j])))) {
                if (!sArray[i].equals(sArray[j])) return false;

                i++;
                j--;    
            } else {
                if (isLetter(sArray[i])){
                    j--;
                } else{
                    i++;
                }
            }
        }
                    
                    
        return true;
    }
    
    private Boolean isLetter(String s){
        if (s.replaceAll("[^\\p{L}\\p{Nd}]+", "").equals("")) return false;
        
        return true;
    }
}
