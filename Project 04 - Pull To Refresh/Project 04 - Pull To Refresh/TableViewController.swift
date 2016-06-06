//
//  TableViewController.swift
//  Project 04 - Pull To Refresh
//
//  Created by Nauman Ahmad on 6/6/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var tableData = ["Cat", "Dog", "Panda"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: #selector(TableViewController.refresh), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func refresh() {
        // Add new data to array
        tableData.append("Elephant")
        tableData.append("Ant")
        tableData.append("Hamster")
        
        // Animate entry of new cells to table view
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        self.tableView.reloadSections(sections, withRowAnimation: .Automatic)
        
        self.refreshControl?.endRefreshing()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = self.tableData[indexPath.row]
        return cell
    }

}
