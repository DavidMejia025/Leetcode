// 3:18
class Solution {
    public String convert(String s, int numRows) {
        if (numRows == 1) return s;

        StringBuilder newS  = new StringBuilder();
        int sLength         = s.length();
        List<Integer> moves = new ArrayList<>();
        
        int move;
        int j;
        int toogle;
        int left   = numRows + (numRows - 2);
        int right  = 0;
        
        moves.add(left);
        moves.add(right);
        
        for (int i = 0; i < numRows; i++) {
            toogle = 1;
            move   = moves.get(toogle);
            j      = i;
            
            while(j < sLength){  
                if (i == 0)           toogle = 0;
                if (i == numRows - 1) toogle = 1;

                newS.append(s.charAt(j));
                
                if ((i != 0) && (i != (numRows - 1))){
                    toogle = (toogle == 0) ? 1 : 0;
                }
                
                move = moves.get(toogle);
                j   += move;
            }

            left  = left  - 2;
            right = right + 2;
            moves.set(0, left);
            moves.set(1, right);    
        }
        
        return newS.toString();
    }
}

