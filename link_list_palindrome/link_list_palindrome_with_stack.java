import java.io.*; 
import java.util.*; 
class Solution {
    public boolean isPalindrome(ListNode head) {
        if(head == null)               return true;
        if(calculateLength(head) == 1) return true;
        
        int listLength       = calculateLength(head);
        Stack<Integer> stack = new Stack<Integer>();
        int count            = 0;
        int stackValue;
        
        while (count < listLength/2){
            stack.push(head.val);
            
            head = head.next;
            count++;
        }
        
        if (listLength % 2 != 0) head = head.next;
        
        while (head.next != null){
            stackValue = stack.pop();
            
            if(stackValue != head.val) return false;
            
            head = head.next;
        }
        
        stackValue = stack.pop();
        
        if(stackValue != head.val) return false;
    
        return true;
    }
