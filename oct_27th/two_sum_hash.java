class Solution {
    public int[] twoSum(int[] nums, int target) {
        HashMap<Integer, Integer> numbers = new HashMap<Integer, Integer>();
        int[] result = new int[2];
        
        numbers = toHash(numbers, nums);

        for (int i = 0; i < nums.length; i++) {
            int num = target - nums[i];

              if((numbers.get(num) != null) && (numbers.get(num) != i)) {
                  result[0] = i;
                  result[1] = numbers.get(num);
                  
                  return result;
              }
        }
        
        return result;
    }
    
    private HashMap<Integer,Integer> toHash(HashMap<Integer, Integer> numbers, int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            numbers.put(nums[i], i);
        }
        
        return numbers;
    }
}
