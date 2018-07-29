//: [Previous](@previous)


/*
 //     ***** First Come First Serve (FCFS) Scheduling Algorithm with Convoy Effect *****
 //
 //     This algorithm is same as the FCFS but explains how the sequence in which processes
 //     enter the system will effect the average waiting time and average turn around time.
 //
 //     Convoy Effect:
 //     It is the phenomenon which is assosciated with FCFS, in which the whole Operating
 //     System slows down due to certain sequence of processes enteting the system.
 //
 //     For Example:
 //     Let us take the same example from FCFS but with now different sequence of processes,
 //     [3,3,24] and calculate the waiting time and turn around time.
 //     We observe that there is a drastic drop in average waiting time and average turn
 //     around time.
 //     Hence, this effect explains that the sequence of processes entering matters a lot
 //     in CPU Scheduling.

*/

//:CODE SECTION:
import UIKit
import PlaygroundSupport

var bt:[Int] = [3,3,24]         //Burst time of the processes
var wt:[Int] = []
var tat:[Int] = []
var awt:Float = 0.0
var atat:Float = 0.0
var n:Int = 3                   // Number of processes
wt.insert(0,at:0)
for i in 1..<n                  //Calculate the time taken by each process to complete
{   var x = 0
    for j in 0..<i{
        x = x + bt[j]
    }
    wt.insert(x,at:i)
}
print("\n*** First Come First Serve (FCFS) Scheduling Algorithm ***\nConvoy Effect\n")
print("THE PROCESSES WILL EXECUTE IN FOLLOWING SEQUENCE: ")
for i in 0..<n
{
    print(i+1)
}
print("\nProcess\tBurst Time \tWaiting Time\tTurn Around Time")
print("==========================================================")

for i in 0..<n{                //Calculate the Waiting Time and Turn Around Time for each process
    tat.insert(bt[i]+wt[i],at:i)
    awt = awt + Float(wt[i])
    atat = atat + Float(tat[i])
    print("   \(i+1)\t\t\t\(bt[i])\t\t\t\(wt[i])\t\t\t\(tat[i])")
}
awt = awt/Float(n)             // Calculate Average Waiting time
atat = atat/Float(n)           // Calculate Average Turn Around Time time

print("\nAverage Waiting Time: \(awt) ms")
print("Average Turn Around Time: \(atat) ms")

//     *** CHECK THE OUTPUT OF THE CODE ***

//     ****** PLEASE GO TO NEXT PLAYGROUND PAGE ******

//: [Next](@next)

//: Created By Rahul Gala
