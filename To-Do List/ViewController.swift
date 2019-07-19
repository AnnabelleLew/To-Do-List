//
//  ViewController.swift
//  To-Do List
//
//  Created by Girls Who Code on 7/11/19.
//  Copyright © 2019 Girls Who Code. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    func addNewTask() {
        if (taskTextField.text != "") {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/YY"
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newTask = Task(context: context)
            newTask.taskName = taskTextField?.text
            newTask.date = formatter.string(from: datePicker.date)
            newTask.time = timeFormatter.string(from: datePicker.date)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            print(newTask.taskName!)
            taskTextField.text = ""
            taskTextField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        //or
        //self.view.endEditing(true)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.setValue(UIColor(red:CGFloat(225.0/255.0), green:CGFloat(255.0/255.0), blue:CGFloat(225.0/255.0), alpha:1), forKeyPath: "textColor")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    @IBAction func addTaskButtonPress(_ sender: Any) {
        addNewTask()
    }
    
}

