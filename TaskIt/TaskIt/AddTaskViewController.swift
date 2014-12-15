//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Zachary Weiner on 12/14/14.
//  Copyright (c) 2014 zachary.weiner. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var mainVC: ViewController!
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        
        var task = TaskModel(Task: taskTextField.text, SubTask: subTaskTextField.text, Date: dueDatePicker.date)
        self.mainVC.taskArray.append(task)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
