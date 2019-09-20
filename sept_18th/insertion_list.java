/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode insertionSortList(ListNode head) {
        if((head == null) || (head.next == null)) return head;

        boolean found;
        ListNode newElement;
        ListNode aux;
        ListNode deepSort;
        ListNode sorted = new ListNode(head.val);

        head = head.next;

        while (head!= null){
            deepSort = sorted;

            if(head.val <= deepSort.val){
                newElement      = new ListNode(head.val);
                newElement.next = sorted;
                sorted          = newElement;
            } else{
                if (deepSort.next == null){

                    newElement  = new ListNode(head.val);
                    sorted.next = newElement;
                }else{
                    found = false;
                    while((deepSort.next != null) && (found == false)){

                        if(head.val <= deepSort.next.val){
                            newElement      = new ListNode(head.val);
                            aux = deepSort.next;
                            deepSort.next = newElement;
                            newElement.next = aux;
                            found = true;
                        }

                        deepSort = deepSort.next;

                        if ((deepSort.next == null) && (found == false)){
                            System.out.println("last");
                            newElement  = new ListNode(head.val);
                            deepSort.next = newElement;
                            found = true;
                        }
                    }

                }

            }
            head = head.next;
        }

        return sorted;
    }
}
