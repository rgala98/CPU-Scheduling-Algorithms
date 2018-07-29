//: [Previous](@previous)
/*
 //     ***** First Come First Serve (FCFS) Scheduling Algorithm *****
 //
 //     It is the simplest non-preemptive scheduling algorithm.
 //     The process that requests the CPU first is allocated the CPU first.
 //     The process that comes first will be executed first and next process
 //     starts only after the previous gets fully executed.Here we are
 //     considering that arrival time for all processes is 0.
 //
 //     It is a Non - Preeemptive Scheduling Algorithm.
 //
 //     Implementation:
 //     Given 3 processes with their IDs and burst times, the task is to find average
 //     waiting time and average turn around time using FCFS scheduling algorithm.
 //
 //     For Example:
 //     We have 3 processes with ID [1,2,3] and Burst Time [24,3,3]. They enter the
 //     system as given. According to FCFS they will execute in same patten in which
 //     they have enetred.
 // 
 //     Terms to understand:
 //
 //         --> Completion Time: Time at which process completes its execution.
 //
 //         --> Burst Time: Time at which process completes its execution.
 //
 //         --> Turn Around Time: Time Difference between completion time and arrival time.
 //             Turn Around Time = Burst Time – Arrival Time
 //
 //         --> Waiting Time(W.T): Time the process had to wait after entering the system.
 //                                Its is the time Difference between turn around time and
 //                                burst time.
 //             Waiting Time = Turn Around Time – Burst Time
 */
//:CODE SECTION:
import UIKit
import PlaygroundSupport

var bt:[Int] = [24,3,3]         //Burst time of the processes
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
print("\n*** First Come First Serve (FCFS) Scheduling Algorithm ***\n")
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
