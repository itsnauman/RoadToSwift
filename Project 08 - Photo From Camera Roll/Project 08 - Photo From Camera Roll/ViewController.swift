//
//  ViewController.swift
//  Project 08 - Photo From Camera Roll
//
//  Created by Nauman Ahmad on 6/22/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set keyboard observers
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWasShown), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWasDismissed), name: UIKeyboardWillHideNotification, object: nil)
        
        let numberToolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        let cameraBtn = UIBarButtonItem(barButtonSystemItem: .Camera, target: nil, action: nil)
        let trashBtn = UIBarButtonItem(barButtonSystemItem: .Trash, target: nil, action: #selector(ViewController.clearTextView))
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .Cancel, target: nil, action: #selector(ViewController.pullDownKeyboard))
        
        let fixed = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        let flex = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        numberToolbar.items = [cameraBtn, fixed, trashBtn, flex, cancelBtn]
        numberToolbar.sizeToFit()
        numberToolbar.barTintColor = UIColor.whiteColor()
        numberToolbar.barStyle = .Default
        fixed.width = 20.0
        
        self.textView.inputAccessoryView = numberToolbar
    }
    
    func keyboardWasShown(sender: NSNotification) {
        if let keyboardSize = (sender.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    
    func keyboardWasDismissed(sender: NSNotification) {
        if let keyboardSize = (sender.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height
        }
    }
    
    func pullDownKeyboard() {
        self.textView.resignFirstResponder()
    }
    
    func clearTextView() {
        self.textView.text = ""
    }
}

