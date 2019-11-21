//5:30pm
class Solution {
    public String convert(String s, int numRows) {
        if(numRows < 2) return s;
        
        char[]   sArray    = s.toCharArray();
        char[][] newSArray = new char[numRows][sArray.length];
        char[]   newS      = new char[(sArray.length) - 1];
        
        char[][] zzArray = buildZZ(newSArray, sArray, numRows);
        //System.out.println(Arrays.deepToString(zzArray));
        
        newS = concatArrays(zzArray, newS);
        
        return String.valueOf(newS);
    }
    
    public static char[][] buildZZ(char[][] newSArray, char[] sArray, int numRows){
        int i = 0; int j = 0; int k = 0;
        boolean down  = true;
        
        while(i < sArray.length){
          if((j < numRows) && (down == true)) {
            newSArray = moveDown(newSArray, sArray, i, j ,k);  
            
            if(j < numRows)  j++;
            if(j == numRows){
              down = false;
              j--;
            } 
          } else{
              k++; j--;
              
              newSArray = moveRight(newSArray, sArray,  i, j, k);  
              
              if(j == 0){
                down = true; 
                j++;
              } 
          } 
    
          i++;
        }
        
        return newSArray;
    }
    
    public static char[][] moveDown(char[][] newSArray, char[] sArray, int i, int j, int k){
        newSArray[j][k] = sArray[i];
        
        return newSArray;
    }
    
    public static char[][] moveRight(char[][] newSArray, char[] sArray, int i, int j, int k){
        newSArray[j][k] = sArray[i];
        
        return newSArray;
    }
    
    public static char[] concatArrays(char[][] newSArray, char[] newS) {
        int deep     = newSArray.length;
        int width    = newSArray[0].length;
        int k        = 0;
        
        for(int i = 0; i < deep; i++){
            for(int j = 0; j < width; j++){
                if(newSArray[i][j] == ' '){
                    //System.out.println(newSArray[i][j]);
                    //newS[k] = newSArray[i][j];
                    k++;
                }
            }
        }
                   
        return newS;
    }
}
