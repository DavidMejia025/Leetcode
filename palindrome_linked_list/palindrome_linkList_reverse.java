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
        ListNode currentList  = head;
        ListNode reversedList = new ListNode(0);
        ListNode auxList      = new ListNode(head.val);
        int aux;
        
        while (currentList.next != null){            
            aux = currentList.next.val;
            reversedList.val  = aux;
            System.out.println(reversedList.val);
            reversedList.next = auxList;   
            System.out.println(reversedList.next.val);
            System.out.println("33333333333333333");
            System.out.println(reversedList.val);
            System.out.println(reversedList.next.val);
            auxList.val = reversedList.val;
            auxList.next = reversedList.next;
            System.out.println(reversedList.val);
            System.out.println(reversedList.next.val);
            System.out.println("33333333333333333");
            
            currentList = currentList.next;
        }
        
        System.out.println("FIREEEE");
        System.out.println(reversedList.val);
        System.out.println(reversedList.next.val);
        //System.out.println(reversedList.val);
        //System.out.println(reversedList.next.val);
        
        ListNode checkHead     = head;
        ListNode checkReversed = reversedList;

        while (checkHead.next != null){
            //System.out.println(checkHead.val);
            //System.out.println(checkReversed.val);
            checkHead = checkHead.next;
            checkReversed = checkReversed.next;
        }
        
        //System.out.println(checkReversed.val);
        //System.out.println(reversedList.val);
        
        return true;
    }
}
//head = { val, tail}

//reversed =
/*
head      1->2->3
reversed
1

2->1

3 2 1 

/*
1->2->2->1

    
    O(n) length
    deslinkear las listas o(n/2)
    verificar O(n)
    1<-2 2->1  
    */
