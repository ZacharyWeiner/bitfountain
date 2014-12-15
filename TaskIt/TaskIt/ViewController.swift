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
    
    var taskArray: [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let date1 = Date.from(year: 2014, month: 12, day: 15)
        let date2 = Date.from(year: 2014, month: 12, day: 31)
        let date3 = Date.from(year: 2015, month: 1, day: 15)
        let task1:TaskModel = TaskModel(Task:"Learn French", SubTask : "listen to audio book chapter 4", Date: date1)
        let task2:TaskModel = TaskModel(Task:"Octo Demo", SubTask:"make meetings work",Date:date2)
        let task3:TaskModel = TaskModel(Task:"bitFountain", SubTask:"complete swift course",Date: date3)
        let task4:TaskModel = TaskModel(Task:"Learn French", SubTask:"listen to audio book chapter 4", Date:date3)
        taskArray = [task1, task2, task3, task4]
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        let taskDict:TaskModel = taskArray[indexPath.row]
        cell.taskLabel.text = taskDict.Task
        cell.subTaskLabel.text = taskDict.SubTask
        cell.dateLabel.text = Date.toString(date: taskDict.Date)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected row: \(indexPath.row)")
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = (segue.destinationViewController as TaskDetailViewController)
            let indexPath = tableView.indexPathForSelectedRow()!
            let thisTask = taskArray[indexPath.row]
            detailVC.taskDetail = thisTask
            detailVC.mainVC = self
        }else if(segue.identifier == "addNewTask"){
            let newVC : AddTaskViewController = (segue.destinationViewController as AddTaskViewController)
            newVC.mainVC = self
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

