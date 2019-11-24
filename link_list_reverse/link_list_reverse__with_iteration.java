
class Solution {
    public ListNode reverseList(ListNode head) {
        if(head == null)               return head;
        if(calculateLength(head) == 1) return head;
        
        ListNode otherList = cloneList(head);
        ListNode aux       = new ListNode(otherList.val);
        ListNode reverse   = new ListNode(otherList.next.val);
        reverse.next       = aux;
        
        aux                = cloneList(reverse);
        otherList = otherList.next;
               
        while(otherList.next != null){
            reverse.val  = otherList.next.val;
            reverse.next = aux;
            
            aux = cloneList(reverse);
            otherList = otherList.next;
        }
        
        return reverse;
    }
    private int calculateLength(ListNode head){
        int count = 1;

        while(head.next != null){
            count++;
            head = head.next;
        }

        return count;
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

