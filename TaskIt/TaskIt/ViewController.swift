//
//  ViewController.swift
//  TaskIt
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let date1 = Date.from(year: 2014, month: 12, day: 15)
        let date2 = Date.from(year: 2014, month: 12, day: 31)
        let date3 = Date.from(year: 2015, month: 1, day: 15)
        let date4 = Date.from(year: 2015, month: 1, day: 28)
        self.fetchedResultsController = getFetchedResultsController()
        self.fetchedResultsController.delegate = self
        fetchedResultsController.performFetch(nil)
    }
    
    //UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        let taskDict:TaskModel = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
        cell.taskLabel.text = taskDict.task
        cell.subTaskLabel.text = taskDict.subTask
        cell.dateLabel.text = Date.toString(date: taskDict.date)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections![section].numberOfObjects
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
        let thisTask = self.fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
        if indexPath.section == 0{
            thisTask.completed = true
        }else{
            thisTask.completed = true
        }
        (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
    }
    
    //NSFetchedResultsControllerDelegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = (segue.destinationViewController as TaskDetailViewController)
            let indexPath = tableView.indexPathForSelectedRow()!
            let thisTask:TaskModel = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
            detailVC.taskDetail = thisTask
        }else if(segue.identifier == "addNewTask"){
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func taskFetchRequest() -> NSFetchRequest{
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending:true)
        fetchRequest.sortDescriptors = [sortDescriptor, completedDescriptor]
        return fetchRequest
    }
    
    func getFetchedResultsController () -> NSFetchedResultsController{
        var fetchedResultsController = NSFetchedResultsController(
                                            fetchRequest: taskFetchRequest(),
                                            managedObjectContext: managedObjectContext,
                                            sectionNameKeyPath: "Completed",
                                            cacheName: nil)
        return fetchedResultsController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

