//: [Previous](@previous)
/*
 //     ***** Priority Scheduling Algorithm *****
 //
 //     Round Robin is a CPU scheduling algorithm where each process is
 //     assigned a fixed time slot in a cyclic way.
 //
 //     It is a Preeemptive Scheduling Algorithm.
 //     Here, each process is swapped in and out of the memory after certain
 //     time quantum irrespective of they are completely executed or not.
 //     Each process gets fair CPU time time execute.
 //
 //     Context switching is used to save states of preempted processes.
 //
 //     It is the starvation free process since, each process gets fair
 //     time share of CPU.
 //
 //     Implementation:
 //     Given 3 processes with their IDs and burst times, the task is to find average
 //     waiting time and average turn around time using RR scheduling algorithm.
 //
 //     Algorithm:
 //         --> Enter the processes with their burst time and priority.
 //         --> Sort the struct of processes, burst time and priority according to the priority.
 //         --> Apply the FCFS algorithm.
 //
 //     For Example:
 //     We have 3 processes with ID [1,2,3] and Burst Time [10,5,8] and priority [2,0,1]. They
 //     enter the system as given. According to Priority Scheduling the processes would be
 //     sorted first according to priority(Higher the number, higher the priority). Then they
 //     will follow the FCFS.
 //
 //     Terms to understand:
 //
 //         --> Completion Time: Time at which process completes its execution.
 //
 //         --> Burst Time: Time at which process completes its execution.
 //
 //         --> Priority: The importance of execution of each process
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
        var priority:Int
}

func comp(a:Process,b:Process)->Bool       // Function to compare the the burst time of the processes and return Boolean value
{
    return (a.priority>b.priority)
}

func findWT(proc:[Process],n:Int) -> [Int]          // Function to find the waiting time
{
    var wt:[Int] = []
    wt.insert(0,at:0)
    
    var x:Int
    for i in 1...n-1                                // Calculate the waiting time for each process
    {
        x = proc[i-1].bt + wt[i-1]
        wt.insert(x,at:i)
    }
    return wt
}

func findTAT(proc:[Process],n:Int,w:[Int]) -> [Int]      //Function to find the turn around time
{
    var tat:[Int] = []
    var x:Int
    for i in 0...n-1                                  // Calculate the Turn Around Time for each processes
    {
        x = proc[i].bt + w[i]
        tat.insert(x,at:i)
    }
    return tat
}

func avg(proc:[Process],n:Int)                 // Function to find the average Waiting Time and Turn Around Time
{
    var fwt = findWT(proc:proc,n:n)
    var ftat = findTAT(proc:proc, n:n, w:fwt)
    
    print("\nProcess\tBurst Time \tWaiting Time\tTurn Around Time");
    print("=========================================================")
    var total_wt:Int = 0
    var total_tat:Int = 0
    for i in 0...n-1
    {
        total_wt = total_wt + fwt[i]
        total_tat = total_tat + ftat[i]
        print("   \(proc[i].pid) \t\t    \(proc[i].bt)  \t\t     \(fwt[i]) \t\t\t  \(ftat[i])");
    }
    print("\n\nAverage Waiting Time: \(Float(total_wt)/Float(n)) ms")            // Calculate Average Waiting time
    print("\nAverage Turn Around Time: \(Float(total_tat)/Float(n)) ms")         // Calculate Average Turn Around Time time
}

func sort(proc:[Process],n:Int)->[Process]        //Function to sort the process according to the waiting time
{
    var p:[Process] = proc
    for i in 0..<n-1                        // Using the Selection Sort technique to sort the values
    {   var lowest:Int = i
        for j in i+1..<n
        {
            if(comp(a:proc[j],b:proc[lowest]) == true)
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


print("\n*** PRIORITY SCHEDULING ***\n\n")
var pro:[Process] = []
let x=Process(pid:1,bt:10,priority:2)
let y=Process(pid:2,bt:5,priority:0)
let z=Process(pid:3,bt:8,priority:1)
pro.insert(x, at: 0)
pro.insert(y, at: 1)
pro.insert(z,at: 2)
pro = sort(proc:pro,n:3)
print("THE PROCESSES WILL EXECUTE IN FOLLOWING SEQUENCE: ")
for i in 0..<pro.count
{
    print("\(pro[i].pid)")
}
avg(proc: pro, n: pro.count)

//     *** CHECK THE OUTPUT OF THE CODE ***

//     ****** PLEASE PROCEED TO NEXT PLAYGROUND PAGE ******

//: [Next](@next)

//: Created By Rahul Gala
