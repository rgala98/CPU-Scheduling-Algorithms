
//: [Previous](@previous)
/*
 //     ***** Shortest Job First (SJF) Scheduling Algorithm *****
 //
 //     In shortest job first scheduling algorithm, the processor selects
 //     the waiting process with the smallest execution time to execute next.
 //
 //     It is a Greedy Algorithm.
 //     It is a Non - Preeemptive Scheduling Algorithm.
 //
 //     It has the advantage of having minimum average waiting time among
 //     all scheduling algorithms.
 //
 //     It may cause starvation if shorter processes keep coming. This
 //     problem can be solved using the concept of aging.
 //
 //     Implementation:
 //     Given 4 processes with their IDs and burst times, the task is to find average
 //     waiting time and average turn around time using SJF scheduling algorithm.
 //
 //     Algorithm:
 //         --> Sort all the processes in increasing order according to burst time.
 //         --> Then apply FCFS algorithm.
 //
 //     For Example:
 //     We have 4 processes with ID [1,2,3,4] and Burst Time [6,8,7,3]. They enter the
 //     system as given. According to SJF the shortest one will execute first and then
 //     it will follow the asending order. The order will be <4,1,3,2> since the process
 //     with id: 4 has the lowest burst time and process with id: 2 has the highest.
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

struct Process                          //A structure for the process id and burst time
{
    var pid:Int
    var bt:Int
}

func comp(a:Process,b:Process)-> Bool       // Function to compare the the burst time of the processes and return Boolean value
{
    return(a.bt>b.bt)
}

func findWT(pr:[Process],n:Int) ->[Int]     // Function to find the waiting time
{
    var w:[Int] = []
    w.insert(0,at:0)
    for i in 1..<n                        // Calculate the waiting time for each process
    {
        w.insert(pr[i-1].bt + w[i-1],at:i)
    }
    return w
}

func findTAT(pr:[Process],n:Int,w:[Int]) -> [Int]       // Function to find the turn around time
{
    var t:[Int] = []
    for i in 0..<n                              // Calculate the Turn Around Time for each processes
    {
        t.insert(pr[i].bt + w[i],at:i)
    }
    return t
}
func sort(pr:[Process],n:Int)->[Process]        //Function to sort the process according to the waiting time
{
    var p:[Process] = pr
    for i in 0..<n-1                        // Using the Selection Sort technique to sort the values
    {   var lowest:Int = i
        for j in i+1..<n
        {
            if(comp(a:p[lowest],b:p[j]) == true)
            {
                lowest = j
            }
        }
        if (i != lowest)
        {
            p.swapAt(i,lowest)
        }
    }
    return p
}

func avg(pr:[Process],n:Int)                // Function to find the average Waiting Time and Turn Around Time
{
    var wt = findWT(pr: pr, n: n)
    var tat = findTAT(pr: pr, n: n, w: wt)
    var awt:Float=0.0
    var atat:Float=0.0
    print("\nProcess\tBurst Time \tWaiting Time\tTurn Around Time")
    print("===========================================================")
    for i in 0..<n{
        awt = awt + Float(wt[i])
        atat = atat + Float(tat[i])
        print("   \(pr[i].pid)\t\t\t\(pr[i].bt)\t\t\t\(wt[i])\t\t\t\(tat[i])")
    }
    awt = awt/Float(n)             // Calculate Average Waiting time
    atat = atat/Float(n)           // Calculate Average Turn Around Time time
    print("\nAverage Waiting Time: \(awt) ms")
    print("Average Turn Around Time: \(atat) ms")
}
print("\n*** SHORTEST JOB FIRST (NON-PREEMPTIVE) SCHEDULING ***\n\n")
var pro:[Process] = []              //Create a list of struct Process

let x=Process(pid:1,bt:6)
let y=Process(pid:2,bt:8)
let z=Process(pid:3,bt:7)
let a=Process(pid:4,bt:3)
pro.insert(x, at: 0)
pro.insert(y, at: 1)
pro.insert(z,at: 2)
pro.insert(a,at: 3)

pro = sort(pr:pro,n:pro.count)
print("THE PROCESSES WILL EXECUTE IN FOLLOWING SEQUENCE: ")
for i in 0..<pro.count
{
    print("\(pro[i].pid)")
}
avg(pr: pro, n:pro.count)

//     *** CHECK THE OUTPUT OF THE CODE ***

//     ****** PLEASE PROCEED TO NEXT PLAYGROUND PAGE ******

//: [Next](@next)

//: Created By Rahul Gala
