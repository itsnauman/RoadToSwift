//
//  TodoItem.swift
//  Project 02 - Todo
//
//  Created by Nauman Ahmad on 5/30/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import Foundation

struct TodoItem {
    var title: String
    var description: String
    var completed: Bool
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.completed = false
    }
}

var todoList = [TodoItem]()