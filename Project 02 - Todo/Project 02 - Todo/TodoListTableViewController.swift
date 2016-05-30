//
//  TodoListTableViewController.swift
//  Project 02 - Todo
//
//  Created by Nauman Ahmad on 5/30/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        todoList.append(TodoItem(title: "Buy a rocket 🚀", description: "Muree Road 🚘"))
        todoList.append(TodoItem(title: "Meet my friend 👸", description: "Bahria Town, Islamabad 🐽"))
        todoList.append(TodoItem(title: "Go to the hospital 🚑", description: "Peshawar Road ⚽️"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                cell!.textLabel?.textColor = UIColor.grayColor()
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
        swap(&todoList[fromIndexPath.row], &todoList[toIndexPath.row])
    }

    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
