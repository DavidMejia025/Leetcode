import java.util.Stack;
class Solution {
    public boolean isValid(String s) {
        Stack<Character> stackRound  = new Stack<Character>();
        char[] charArray = s.toCharArray();
        Character c1;
        Character c2;

        if(s.equals("")) return true;
        if(charArray.length < 2) return false;

        for (int i = 0; i < charArray.length ; i++){
            c1 = charArray[i];

            if ((c1.equals('(')) || (c1.equals('{')) || (c1.equals('['))) {
                stackRound.push(c1);
            }else{
                if(stackRound.size() < 1) return false;

                c2 = stackRound.pop();

                if ((c2.equals('('))){
                    if(!(c1.equals(')'))) return false;
                }else if((c2.equals('{'))){
                    if(!(c1.equals('}'))) return false;
                }else{
                    if(!(c1.equals(']'))) return false;
                }
            }
        }
        System.out.println(stackRound.size());

        if (stackRound.size() > 0) return false;

        return true;
    }
}
