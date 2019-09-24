# Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.
# To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as an array of integers
# [start_time, end_time]. These integers represent the number of 30-minute blocks past 9:00am.
# For example:
# [2, 3]  # meeting from 10:00 – 10:30 am
# [6, 9]  # meeting from 12:00 – 1:30 pm
#
# Input: Array M of n meeting array element (meeting element is of the form [a,b])
# Output: Array B containint the block of time when there are some meeting.
#
# Example:
# A = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
# B = [[0, 1], [3, 8], [9, 12]]
#
# Do not assume the meetings are in order. The meeting times are coming from multiple teams.
#
# Write a solution that’s efficient even when we can’t put a nice upper bound on the numbers representing our time ranges. Here we’ve simplified our times down to the number of 30-minute slots past 9:00 am. But we want the method to work even for very large numbers, like Unix timestamps. In any case, the spirit of the challenge is to merge meetings where start_time and end_time don’t have an upper bound.
#
require 'date'
def merge_ranges(m)
  m.sort!

  meeting = [m[0].first, m[0][1]]

  b = [meeting]

  for i in 1..(m.length)-1 do
    if meeting[1] < m[i].first && meeting.first < m[i].first
      meeting = [m[i].first, m[i][1]]

      b.push(meeting)
    end
  end

  meeting[1] = m[i][1] if meeting.first <= m[i].first && meeting[1] <= m[i][1]

  b
end

meeting_hour = lambda{|h,m| DateTime.new(2019,8,17,h,m,0).to_time.to_i}
meeting_date = lambda{|epoch| DateTime.strptime(epoch.to_s,'%s')}

a = [9,10]
b = [13,14]
c = [16,17]

m1 = [a,b,c]
m2 = [b,[a[0], 15],c]
m3 = [c,b,[a[0],19]]

meetings =  [m1, m2, m3]

meetings.each do|meeting|
  meeting = meeting.map do|met|
    [meeting_hour.call(met[0],0),meeting_hour.call(met[1],0)]
  end

meeting
blocking_hours = merge_ranges(meeting)

  b_h = blocking_hours.each do|hour|
   [meeting_date.call(hour[0]).hour, meeting_date.call(hour[1]).hour]
  end

p b_h
end

a = [9,10]
b = [13,14]
c = [16,17]

m1 = [a,b,c]
m2 = [b,[a[0], 15],c]
m3 = [c,b,[a[0],19]]

meetings =  [m1, m2, m3]

meetings.each do|meeting|

meeting
blocking_hours = merge_ranges(meeting)

p blocking_hours
end

p merge_ranges([[1,3],[2,6],[8,10],[15,18]])
p merge_ranges([[1,4],[4,5]])