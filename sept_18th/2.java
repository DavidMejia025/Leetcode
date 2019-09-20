class Solution {
    public ListNode insertionSortList(ListNode head) {
    ListNode nullHead = new ListNode(-1);
    nullHead.next = null;
    ListNode p;
    ListNode pre;
    while(head != null){
        pre = nullHead;
        p = nullHead.next;
        while(p != null && p.val < head.val){
            pre = p;
            p = p.next;
        }
        pre.next = head;
        head = head.next;
        pre.next.next = p;
    }
    return nullHead.next;
}

}
