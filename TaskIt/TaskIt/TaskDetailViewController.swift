//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var taskDetail:TaskModel!
    var mainVC:ViewController! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTextField.text = taskDetail.Task
        self.subTaskTextField.text = taskDetail.SubTask
        let compareDate = Date.from(year: 2014, month: 1, day: 1)
        self.dueDatePicker.setDate(taskDetail.Date, animated: true)
    }

    @IBAction func doneButtonTapped(sender: UIBarButtonItem) {
        var task:TaskModel = TaskModel(Task: taskTextField.text, SubTask: subTaskTextField.text, Date: dueDatePicker.date, Completed: false)
        mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
        self.navigationController?.popViewControllerAnimated(true)
    }
}
