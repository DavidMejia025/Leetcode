import java.util.regex.Matcher;
import java.util.regex.Pattern;

class Solution {
    public boolean isPalindrome(String s) {
        if (s.equals("")) return true;
        
        Pattern p = Pattern.compile("\\w");
        Matcher m = p.matcher(s);

        String newS = "";

        while(m.find()) {
            newS += m.group();
        }
        
        String[] sArray = newS.toLowerCase().split("");
        
        System.out.println("start");
        
        int i = 0; int j = (sArray.length) - 1;
        
        while (i < j){
            if (!sArray[i].equals(sArray[j])) return false;
            
            i++;
            j--;
        }
        return true;
    }
}
