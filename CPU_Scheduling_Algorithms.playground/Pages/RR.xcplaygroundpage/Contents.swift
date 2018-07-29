//: [Previous](@previous)
/*
 //     ***** Round Robin (RR) Scheduling Algorithm *****
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
 //     Note: The tricky part here is to calucate the Waiting Time. Once the waiting time
 //     is calculated the turn around time and the average time is easy to calculate.
 //
 //     For Example:
 //     We have 5 processes with ID [1,2,3,4,5] and Burst Time [12,8,4,10,5]. They enter the
 //     system as given and the systems has the time quantum of 5 ms. According to RR the
 //     process execution will start and every 5 ms the current process will swap out with the
 //     new process and this continues till all the processes gets completed executed.
 //
 //     Terms to understand:
 //
 //         --> Completion Time: Time at which process completes its execution.
 //
 //         --> Burst Time: Time at which process completes its execution.
 //
 //         --> Time Quantum(q): Fixed time for each process to execute
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

func findWT(pr:[Int],n:Int,bt:[Int],q:Int) ->[Int]      // Function to find the waiting time
{
    var wt:[Int] = []
    for _ in 0..<n
    {
        wt.append(0)
    }
    var bt_cpy = bt                 //A copy of the Burst time list
    var time = 0                    //Starting with time = 0
    while(true)
    {
        var done:Bool = true
        for i in 0..<n                      // Calculate the waiting time for each process
        {
            
            if(bt_cpy[i]>0)
            {
                done = false
                if(bt_cpy[i] > q)
                {
                    time=time+q
                    bt_cpy[i] = bt_cpy[i] - q
                    print(pr[i])
                }
                else
                {
                    time = time + bt_cpy[i]
                    print(pr[i])
                    wt.remove(at: i)
                    wt.insert(time - bt[i],at:i)
                    bt_cpy[i] = 0
                }
            }
        }//end of for loop
        
        if(done == true)
        {
            break
        }
    }//end of while loop
    
    return wt
}

func findTAT(pr:[Int],n:Int,bt:[Int],wt:[Int]) ->[Int]      //Function to find the turn around time
{
    var t:[Int] = []
    for i in 0..<n                                  // Calculate the Turn Around Time for each processes
    {
        t.insert(bt[i]+wt[i], at: i)
    }
    return t
}

func avg(pr:[Int],n:Int,bt:[Int],q:Int) ->Void          // Function to find the average Waiting Time and Turn Around Time
{
    var wt = findWT(pr: pr, n: n, bt: bt, q: q)
    var tat = findTAT(pr: pr, n: n, bt: bt, wt: wt)
    var awt:Float = 0.0
    var atat:Float = 0.0
    print("\nTime Quantum: \(q) ms\n")
    
    print(" \nProcess\tBurst Time \tWaiting Time\tTurn Around Time")
    print("==========================================================")
    
    for i in 0..<n
    {
        awt = awt + Float(wt[i])
        atat = atat + Float(tat[i])
        print("   \(pr[i])\t\t\t\(bt[i])\t\t\t\(wt[i])\t\t\t\(tat[i])")
        
    }
    awt = awt/Float(n)             // Calculate Average Waiting time
    atat = atat/Float(n)           // Calculate Average Turn Around Time time
    print("\nAverage Waiting Time: \(awt) ms")
    print("Average Turn Around Time: \(atat) ms")
}
print("/n*** ROUND ROBIN SCHEDULING ***\n")
print("THE PROCESSES WILL EXECUTE IN FOLLOWING SEQUENCE: ")
var pro:[Int] = [1,2,3,4,5]
var n = pro.count
var bt:[Int] = [12,8,4,10,5]
var q:Int = 5                   //Time quantum  = 5 ms
avg(pr: pro, n: n, bt: bt, q: q)

//     *** CHECK THE OUTPUT OF THE CODE ***

//     ****** PLEASE PROCEED TO NEXT PLAYGROUND PAGE ******

//: [Next](@next)

//: Created By Rahul Gala
