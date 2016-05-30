//
//  AddTodoItemViewController.swift
//  Project 02 - Todo
//
//  Created by Nauman Ahmad on 5/30/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class AddTodoItemViewController: UIViewController {
    @IBOutlet weak var todoItemTitle: UITextField!
    @IBOutlet weak var todoItemDescription: UITextField!
    
    @IBAction func addTodo(sender: AnyObject) {
        let title = self.todoItemTitle.text
        let desc = self.todoItemDescription.text
        todoList.append(TodoItem(title: title!, description: desc!))
        self.todoItemDescription.text = ""
        self.todoItemTitle.text = ""
        self.todoItemDescription.resignFirstResponder()
    }
    
}
