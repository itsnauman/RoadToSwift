//
//  ViewController.swift
//  Project 09 - Search Bar In Table View
//
//  Created by Nauman Ahmad on 6/24/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet weak var tableview: UITableView!
    
    var data = ["Google", "Facebook", "Snapchat", "Yahoo", "Github"]
    var searchResults: [String]!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        // Ensure that the search bar does not remain on the screen if the user navigates to another view controller
        definesPresentationContext = true
        
        let bar = searchController.searchBar
        bar.searchBarStyle = .Minimal
        tableview.tableHeaderView = bar
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchController.active && self.searchController.searchBar.text != "" {
            return searchResults.count
        }
        
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        if self.searchController.active && self.searchController.searchBar.text != "" {
            cell.textLabel?.text = searchResults[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
        }
        
        return cell
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.searchResults = data.filter({ (item) -> Bool in
            return item.lowercaseString.containsString(searchController.searchBar.text!.lowercaseString)
        })
        
        tableview.reloadData()
    }
    
}

