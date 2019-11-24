/* 3. Longest Substring Without Repeating Characters
 * Given a string, find the length of the longest substring without repeating characters.
 * Example 1:

Input: "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
*/

class Solution {
    public int lengthOfLongestSubstring(String s) {
        //if s is empty return 0
        if (s.length() < 1) return 0;

        HashMap<String, Integer> hash = new HashMap<String, Integer>();
        Integer maxLength     = 1;
        Integer currentLength = 0;

        String[] sArray = s.split("");

        for (int i = 0; i< sArray.length; i++) {
            for (int j = i; j < sArray.length; j++){
                if (hash.get(sArray[j]) != null){
                    currentLength = hash.size();
                    if(currentLength > maxLength) maxLength = currentLength;

                    hash.clear();

                    j = sArray.length;
                }else{
                    hash.put(sArray[j],0);
                }
            }
        }

        currentLength = hash.size();
        if(currentLength > maxLength) maxLength = currentLength;

        System.out.println(hash);

            return maxLength;
    }
}
