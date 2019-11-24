/*
 * Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.
*/

class Solution {	
    public int maxArea(int[] height) {
        int head       = 0; 
        int tail       = (height.length) - 1;
        int minHeight  = Math.min(height[head], height[tail]);
        int maxArea    = 0;
        int newArea    = 0;
        
        while(head < tail){
            newArea = (tail - head) * minHeight;
            
            maxArea = Math.max(maxArea, newArea);

            if (height[head] <= height[tail]){
                head++;
            } else{
                tail--;
            }

            minHeight  = Math.min(height[head], height[tail]);
        }

        return maxArea;
    }
}
