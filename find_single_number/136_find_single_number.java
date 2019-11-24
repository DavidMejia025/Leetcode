/*Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?*/
import java.util.Arrays;

class Solution {
    public int singleNumber(int[] nums) {
        Arrays.sort(nums);

        for (int i = 0; i < nums.length - 1; i++){
            int first = nums[i];

            if(nums[i] == nums[i+1]){
                i += 1;
            }else{
              return nums[i];
            }
        }

        return  nums[nums.length -1];
    }
}
