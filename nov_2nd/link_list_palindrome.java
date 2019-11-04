/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public boolean isPalindrome(ListNode head) {
        if(head == null)               return true;
        if(calculateLength(head) == 1) return true;
        
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
        
        return compareLists(head, reverse);
    }
    
    private Boolean compareLists(ListNode listA, ListNode listB){
        Boolean comparison = true;
        
        while(listA.next != null){
            if (listA.val != listB.val) return false;
            
            listA = listA.next;
            listB = listB.next;
            
        }
        
        return comparison;
    }
    
    private int calculateLength(ListNode head){
        int count = 1;
        
        while(head.next != null){
            count++;
            head = head.next;
        }
        
        return count;
    }
    
    private ListNode cloneList(ListNode list){
        ListNode newList = new ListNode(list.val);
        newList.next = list.next;

        return newList;        
    }
}
