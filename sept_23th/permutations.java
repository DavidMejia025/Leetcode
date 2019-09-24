class Solution {
    public List<List<Integer>> permute(int[] nums) {
        int num = nums.length;

        List<Integer> inner      = new ArrayList<Integer>();
        List<List<Integer>> list = new ArrayList<List<Integer>>();

        if (num == 1){
            inner.add(nums[0]);
            list.add(inner);

            return list;
        }

        list = calculatePermutation(num, 1, nums, list);

        return list;
    }

    private List<List<Integer>> calculatePermutation(int target, int num, int[] nums, List<List<Integer>> list){
        if (num == 1){
            List<Integer> inner = new ArrayList<Integer>();

            inner.add(nums[0]);
            list.add(inner);

            return calculatePermutation(target, num+1, nums, list);
        }else if(num == target){
            List<List<Integer>> newList  = new ArrayList<List<Integer>>();
            List<Integer> currentElement = new ArrayList<Integer>();

            list = stagePermutation(newList, currentElement, num, nums, list);

            return list;
        }

        List<List<Integer>> newList  = new ArrayList<List<Integer>>();
        List<Integer> currentElement = new ArrayList<Integer>();

        list = stagePermutation(newList, currentElement, num, nums, list);

        return calculatePermutation(target, num+1, nums, list);
    }

    private List<List<Integer>> stagePermutation(List<List<Integer>>  newList,
         List<Integer> currentElement,
         int num,
         int[] nums,
         List<List<Integer>> list)
    {

        for (int i = 0; i < list.size(); i++){
            currentElement = addElementToList(nums[num-1], list.get(i));
            createAddElements(newList, currentElement);

            newList.add(currentElement);
        }

        return newList;
    }

    private List<Integer> addElementToList(int num, List<Integer> list){
        list.add(num);

        return list;
    }

    private List<List<Integer>> createAddElements(List<List<Integer>> newList, List<Integer> list){
        List<Integer> switchedList = new ArrayList<Integer>();

        for(int i = 0; i < list.size() - 1; i++){
            switchedList = switchElements(list);
            newList.add(switchedList);

            list = switchedList;
        }

        return newList;
    }

    private List<Integer> switchElements(List<Integer> list){
        List<Integer> switchList = new ArrayList<Integer>();

        switchList.add(list.get(list.size() -1));

        for(int i = 0; i < list.size() - 1; i++){
            switchList.add(list.get(i));
        }

        return switchList;
    }
}
/*
pseudo code
calculate the permutation of a number in terms of the permutation of the previeus number.
    1. calculate the permutation of the previews number and store the result.
    2. take the previews result and add the new number to the end of the list.
    3. take each result plus new number and create all the new combinations,
    4. add each set of combinations and result the corresponding list.
additional combinations.
*/
