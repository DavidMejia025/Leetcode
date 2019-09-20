class Solution {
    public int[][] merge(int[][] intervals) {
        //convert intervas to stack
     int[][] newIntevarls = new Array[intervals.lenght()]; //which ds queue list or stack
     int[] firstInterval = intervals.pop();
        
     return recMerge(interval, intervals, newIntervals);   
    }
    
    private int[][] recMerge(int[] firstInterval, int[][] intervals, int[][] newIntervals){
        if (intervals.pop() == null) return newIntervals;
        
        int[] secondInterval = intervals.pop();
        
        int[][] newInterval =  mergeTwoIntervals(firstInterval, secondInterval);
        
        newIntervals.push(newInterval);
        firstInterval = intervals.pop()
            
        return recMerge(firstInterval, intervals, newIntervals);
    }
    
    private int[][] mergeTwoIntervals(int[] firstInterval, int[] secondInterval){
        int[] newIntevarls = new Array[2];
        
        if(firstInterval[1] >= secondInterval[0]) {
            newIntervals[0][0]= firstInterval[0];
            newIntervals[0][1] = secondInterval[0][1];
        }else if(subIntefirstIntervalrvals[1] >= secondInterval[1]){
            newIntervals[0][0] = firstInterval[0];
            newIntervals[0][1] = firstInterval[1];
        }else{
            newIntervals[0] = firstInterval;
            newIntervals[1] = secondInterval;
        }
        
        return newIntervals; //or push new intervals to the newInterrvals queue?
    }
}

Test:
_______________________________________________________________________________________________
input = [[1,3],[2,6],[8,13],[15,18]]
_______________________________________________________________________________________________
intervals     = [[1,3],[2,6],[8,13],[15,18]] stack
firstInterval = [1,3]

recMerge([1,3], [[2,6],[8,13],[15,18]], newIntervals)
_______________________________________________________________________________________________
intervals.pop() == null => false
secondInterval = [2,6]
intervals     = [[8,13],[15,18]] stack
mergeTwoIntervals([1,3], [2,6])
_____________________________________________________
if(firstInterval[1] >= secondInterval[0]) => true
newIntervals[0] = 1;
newIntervals[1] = 6;
return [[1,6],[]]
______________________________________________________

newInterval = [[1,6],[]]
newIntervals.push(newInterval);
newInterval = [[1,6],[]]
firstInterval = [8,13]
intervals     = [[15,18]] stack

recMerge([8,13], [[15,18]], [1,6])
_______________________________________________________________________________________________
intervals.pop() == null => false
secondInterval = [15,18]
intervals     = [] stack

mergeTwoIntervals([8,13], [15,18])
_____________________________________________________

if(firstInterval[1] >= secondInterval[0])                   => false
else if(subIntefirstIntervalrvals[1] >= secondInterval[1])  => false
else
newIntervals[0] = [8,13];
newIntervals[1] = [15,18];
return [[8,13],[15,18]]
______________________________________________________

newInterval = [[8,13],[15,18]]
newIntervals.push(newInterval);
newInterval = [[1,6],[],[[8,13],[15,18]]]   // Weird insertion of int [][] in new Intervals
firstInterval = null
intervals     = null

recMerge(null, null, [[1,6],[],[[8,13],[15,18]]])
_______________________________________________________________________________________________
intervals.pop() == null => true
return [[1,6],[],[[8,13],[15,18]]]

clean newIntervals => [[1,6],[8,13],[15,18]]
Result => [[1,6],[8,13],[15,18]]
