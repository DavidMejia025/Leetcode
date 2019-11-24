//Start: 701
import java.io.*; 
import java.util.*; 
import java.util.Queue;

class Solution {
    public ListNode reverseList(ListNode head) {
        if(head == null)               return head;

        Queue<Integer> queue = new LinkedList<>();
        queue.add(head.val);
        
        while(head.next != null){
            int nextVal = head.next.val;
            System.out.println(nextVal);
            queue.add(nextVal);
            
            head = head.next;
        }

        System.out.println(Arrays.toString(queue.toArray()));
        head.val  = queue.remove();
        System.out.println(head.val);
        head.next = null;
        ListNode temp = cloneList(head);
        
        while(queue.size() != 0) {
            head.val  = queue.remove();
            head.next = temp;

            temp = cloneList(head);
        }
        System.out.println(queue.size());
        return head;
    }
    
    private ListNode cloneList(ListNode list){
        ListNode newList = new ListNode(list.val);
        newList.next = list.next;

        return newList;
    }
