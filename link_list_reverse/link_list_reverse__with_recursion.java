import java.io.*; 
import java.util.*; 
import java.util.Queue;

class Solution {
    public ListNode reverseList(ListNode head) {
        if(head == null)      return head;
        if(head.next == null) return head;

        ListNode result = new ListNode(0);
        
        ListNode nextNode = new ListNode(head.val);
        result.val       = head.next.val;
        result.next  = nextNode;
        head = head.next;
        result = recursion(head, result);
        
        return result;
    }
    
    private ListNode recursion(ListNode head, ListNode result){
        if (head.next  == null){
            result.val   = head.val;
            result.next  = cloneList(result);
            
            return result.next;
        }
        
        result.val   = head.val;
        result.next  = cloneList(result);
        
        return recursion(head.next, result);
    }
    
    private ListNode cloneList(ListNode list){
        ListNode newList = new ListNode(list.val);
        newList.next = list.next;

        return newList;
    }

}
