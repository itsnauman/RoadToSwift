//
//  TodoListTableViewController.swift
//  Project 02 - Todo
//
//  Created by Nauman Ahmad on 5/30/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    override func viewDidAppear(animated: Bool) {
        // Animate entry of new todo task
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        self.tableView.reloadSections(sections, withRowAnimation: .Automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        todoList.append(TodoItem(title: "Buy a rocket 🚀", description: "I ❤️ Space X"))
        todoList.append(TodoItem(title: "Meet my friend 👸", description: "YAY!"))
        todoList.append(TodoItem(title: "Visit the dentist 🚑", description: "Root Canal Sucks 😏"))
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = todoList[indexPath.row].title
        cell.textLabel?.font = UIFont(name: "Futura", size: 18)
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            todoList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let completeTodoAction: UITableViewRowAction
        
        if todoList[indexPath.row].completed {
            completeTodoAction = UITableViewRowAction(style: .Default, title: "Undo") { (action, cellIndex) in
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                cell!.textLabel?.textColor = UIColor.blackColor()
                todoList[indexPath.row].completed = false
                tableView.setEditing(false, animated: true) // Close cell
            }
            
            completeTodoAction.backgroundColor = UIColor.grayColor()
        } else {
            completeTodoAction = UITableViewRowAction(style: .Default, title: "Done") { (action, cellIndex) in
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
                cell!.textLabel?.textColor = UIColor.lightGrayColor()
                todoList[indexPath.row].completed = true
                tableView.setEditing(false, animated: true) // Close cell
            }
            
            completeTodoAction.backgroundColor = UIColor.greenColor()
        }
        
        let deleteTodoAction = UITableViewRowAction(style: .Default, title: "Delete") { (action, cellIndex) in
            todoList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        return [deleteTodoAction, completeTodoAction]
    }

    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        if (fromIndexPath != toIndexPath) {
            swap(&todoList[fromIndexPath.row], &todoList[toIndexPath.row])
        }
    }

    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is ViewController {
            let displayTodoVC = segue.destinationViewController as! ViewController
            displayTodoVC.todoItemData = todoList[self.tableView.indexPathForSelectedRow!.row]
        }
    }

}
