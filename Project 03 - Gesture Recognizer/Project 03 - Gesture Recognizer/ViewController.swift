//
//  ViewController.swift
//  Project 03 - Gesture Recognizer
//
//  Created by Nauman Ahmad on 6/1/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var swipeDirection: UILabel!
    
    @IBAction func rightSwipe(sender: AnyObject) {
        swipeDirection.text = "Right Swipe Detected"
    }

    @IBAction func leftSwipe(sender: AnyObject) {
        swipeDirection.text = "Left Swipe Detected"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

