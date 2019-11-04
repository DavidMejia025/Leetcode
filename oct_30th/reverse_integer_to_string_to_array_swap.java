class Solution {
    public int reverse(int x) {
        if((x > 2147483647) || x < (-2147483647)) return 0;
        
        boolean negative = (x < 0);
       
        if (negative == true) x = x * -1;
        //System.out.println(negative);
        //System.out.println(x);
        char[] charArray = Integer.toString(x).toCharArray();
        
        int charArraySize  = charArray.length;
        int charArrayLimit = charArray.length - 1;
        
        char[] newCharArray = new char[charArraySize];
     
        for (int i = 0; i < charArraySize; i++){
            newCharArray[i] = charArray[charArrayLimit];
            
            charArrayLimit--;
        }
         //System.out.println(newCharArray);
        
        double result = Double.parseDouble(new String(newCharArray));

        if ((result > 2147483647) || (result < -2147483644)) return 0;
        
        if (negative == true) result = result * -1;
        
        System.out.println(result);
    
        return (int) result;
    }
}
