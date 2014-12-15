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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTextField.text = taskDetail.task
        self.subTaskTextField.text = taskDetail.subTask
        let compareDate = Date.from(year: 2014, month: 1, day: 1)
        self.dueDatePicker.setDate(taskDetail.date, animated: true)
    }

    @IBAction func doneButtonTapped(sender: UIBarButtonItem) {
        taskDetail.task = taskTextField.text
        taskDetail.subTask = subTaskTextField.text
        taskDetail.date = dueDatePicker.date
        taskDetail.completed = false
        (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
