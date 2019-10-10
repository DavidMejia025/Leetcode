/*Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one*/


class Solution {
    public int findDuplicate(int[] nums) {
        int test;

        for (int j = 0; j < nums.length; j++){
            test = nums[j];

            for (int i = j+1; i < nums.length; i++){
                if(test == nums[i]){
                    return test;
                }else{

                }
            }
        }
        return  nums[nums.length -1];
    }
}
