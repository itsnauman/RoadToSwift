//
//  ViewController.swift
//  Project 02 - Todo
//
//  Created by Nauman Ahmad on 5/30/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var todoItemData: TodoItem?

    @IBOutlet weak var todoItemTitle: UILabel!

    @IBOutlet weak var todoItemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todoItemTitle.text = todoItemData?.title
        self.todoItemDescription.text = todoItemData?.description
    }

}

