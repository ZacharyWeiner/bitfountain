//
//  ViewController.swift
//  TaskIt
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var baseArray:[[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let date1 = Date.from(year: 2014, month: 12, day: 15)
        let date2 = Date.from(year: 2014, month: 12, day: 31)
        let date3 = Date.from(year: 2015, month: 1, day: 15)
        let date4 = Date.from(year: 2015, month: 1, day: 28)
        let task1:TaskModel = TaskModel(Task:"Learn French", SubTask : "listen to audio book chapter 4", Date: date1, Completed: false)
        let task2:TaskModel = TaskModel(Task:"Octo Demo", SubTask:"make meetings work",Date:date2, Completed: false)
        let task3:TaskModel = TaskModel(Task:"bitFountain", SubTask:"complete swift course",Date: date3, Completed: false)
        let task4:TaskModel = TaskModel(Task:"Learn French", SubTask:"listen to audio book chapter 4", Date:date3, Completed: false)
        let taskArray = [task1, task2, task3, task4]
        var completedArray = [TaskModel(Task:"scratch for iOS", SubTask:"complete first part course",Date: date4, Completed: false)]
        
        baseArray = [taskArray, completedArray]
    }
    
    //UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        let taskDict:TaskModel = baseArray[indexPath.section][indexPath.row]
        cell.taskLabel.text = taskDict.Task
        cell.subTaskLabel.text = taskDict.SubTask
        cell.dateLabel.text = Date.toString(date: taskDict.Date)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected row: \(indexPath.row)")
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "ToDo"
        }else{
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0{
            let thisTask:TaskModel = baseArray[indexPath.section][indexPath.row] as TaskModel
            var newTask = TaskModel(Task: thisTask.Task, SubTask: thisTask.SubTask, Date: thisTask.Date, Completed: !thisTask.Completed)
            
            baseArray[indexPath.section].removeAtIndex(indexPath.row)
            baseArray[1].append(newTask)
        }else{
            let thisTask:TaskModel = baseArray[indexPath.section][indexPath.row] as TaskModel
            var newTask = TaskModel(Task: thisTask.Task, SubTask: thisTask.SubTask, Date: thisTask.Date, Completed: !thisTask.Completed)
            
            baseArray[indexPath.section].removeAtIndex(indexPath.row)
            baseArray[0].append(newTask)
        }
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = (segue.destinationViewController as TaskDetailViewController)
            let indexPath = tableView.indexPathForSelectedRow()!
            let thisTask = baseArray[indexPath.section][indexPath.row]
            detailVC.taskDetail = thisTask
            detailVC.mainVC = self
        }else if(segue.identifier == "addNewTask"){
            let newVC : AddTaskViewController = (segue.destinationViewController as AddTaskViewController)
            newVC.mainVC = self
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        baseArray[0] = baseArray[0].sorted{
            (task1:TaskModel, task2: TaskModel) -> Bool in
                return task1.Date.timeIntervalSince1970 < task2.Date.timeIntervalSince1970
        }
        baseArray[1] = baseArray[1].sorted{
            (task1:TaskModel, task2: TaskModel) -> Bool in
            return task1.Date.timeIntervalSince1970 < task2.Date.timeIntervalSince1970
        }

        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

