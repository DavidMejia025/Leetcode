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
        firstInterval = getLastInterval(newIntervals);
            
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
______________________________________________________________________________________________________________________________________
input = [[1,3],[2,6],[8,13],[15,18]]
______________________________________________________________________________________________________________________________________main
intervals     = [[1,3],[2,6],[8,13],[15,18]] to stack
firstInterval = [1,3]

recMerge([1,3], [[2,6],[8,13],[15,18]], newIntervals)
_______________________________________________________________________________________________
(intervals == null)  => false
intervals.pop() => [2,6]
secondInterval = [2,6]
intervals     = [[8,13],[15,18]]

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
clean newIntervals => [[1,6]]
firstInterval = [1,6]
intervals     = [[8,13],[15,18]] 

recMerge([1,6], [[8,13],[15,18]], [1,6])
_______________________________________________________________________________________________
(intervals == null)  => false
intervals.pop() => [8,13]
secondInterval = [8,13]
intervals     = [[15,18]]

mergeTwoIntervals([1,6], [8,13])
_____________________________________________________

if(firstInterval[1] >= secondInterval[0])       => false
else if(firstInterval[1] >= secondInterval[1])  => false
else
newIntervals[0] = [1,6];
newIntervals[1] = [8,13];
return [[1,6],[8,13]]
______________________________________________________

newInterval = [[1,6],[8,13]]
newIntervals.push(newInterval);
newIntervals = [[1,6], [[1,6],[8,13]]]
clean newIntervals => [[1,6],[8,13]]                   **
firstInterval = [8,13]
intervals     = [[15,18]]

recMerge([8,13], [[15,18]], [[1,6],[8,13]] )
_______________________________________________________________________________________________
(intervals == null)  => false
intervals.pop() => [15,18]
secondInterval = [15,18]
intervals     = [null]

mergeTwoIntervals([8,13], [15,18])
______________________________________________________
if(firstInterval[1] >= secondInterval[0])       => false
else if(firstInterval[1] >= secondInterval[1])  => false
else
newIntervals[0] = [8,13];
newIntervals[1] = [15,18];
return [[8,13],[15,18]]
______________________________________________________

newInterval = [[8,13],[15,18]]
newIntervals.push(newInterval);
newIntervals = [[1,6],[8,13],[[8,13],[15,18]]]
clean newIntervals => [[1,6],[8,13],[15,18]]                 **   
firstInterval = [15,18]
intervals     = [null]

recMerge([15,18], null, [[1,6],[8,13],[15,18]] )
_________________________________________________________________________________________________
(intervals == null)  => true
return [[1,6],[8,13],[15,18]]
___________________________________________________________________________________________________________________________________________
Result => [[1,6],[8,10],[15,18]]

______________________________________________________________________________________________________________________________________
input = [[1,4],[4,5]]
______________________________________________________________________________________________________________________________________main
[[1,4],[4,5]] to stack
intervals.pop() => [1,4]
recMerge([1,4], [4,5], []);
_________________________________________________________________________________________________
(intervals == null) => false
 intervals.pop(); => 
secondInterval => [1,4]
mergeTwoIntervals(firstInterval, [4,5]);
______________________________________________________
if(firstInterval[1] > secondInterval[0]) => false
else if(firstInterval[1] >= secondInterval[1])  => false
newIntervals[0] = [1,4];
newIntervals[1] = [4,5];
return [[1,4],[4,5]]
______________________________________________________

newInterval = [[1,4],[4,5]]
newIntervals.push(newInterval);
newIntervals = [[[1,4],[4,5]]]
clean newIntervals => [[1,4],[4,5]]                 **   
firstInterval = [4,5]
intervals     = [null]

recMerge([4,5], null, [[1,6],[[1,4],[4,5]] )
______________________________________________________

(intervals == null)  => true
return [[1,4],[4,5]]
___________________________________________________________________________________________________________________________________________
Result => [[1,4],[4,5]]




