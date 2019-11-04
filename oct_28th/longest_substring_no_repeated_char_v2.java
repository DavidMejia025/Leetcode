class Solution {
    public int lengthOfLongestSubstring(String s) {
        //if s is empty return 0
        if (s.length() < 1) return 0;

        HashMap<String, Integer> hash = new HashMap<String, Integer>();
        Integer maxLength     = 1;
        Integer currentLength = 0;

        String[] sArray = s.split("");

        for (int i = 0,j = 0; j < sArray.length; j++) {
            if (hash.get(sArray[j]) != null){
                currentLength = hash.size();
                
                if(currentLength > maxLength) maxLength = currentLength;
                
                i = hash.get(sArray[j]) + 1;
                j = i;

                hash.clear();
                hash.put(sArray[i],i);
            }else{
                hash.put(sArray[j],j);
            }
        }

        currentLength = hash.size();
        if(currentLength > maxLength) maxLength = currentLength;

        return maxLength;
    }
}
