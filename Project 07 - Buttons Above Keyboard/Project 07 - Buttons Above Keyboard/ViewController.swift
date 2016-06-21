//
//  ViewController.swift
//  Project 07 - Buttons Above Keyboard
//
//  Created by Nauman Ahmad on 6/21/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
    
    /**
     Called when the keyboard appears
    */
    func keyboardWasShown(sender: NSNotification) {
        var info = sender.userInfo!
        let keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue() 
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            // Move the text view up by keyboard height
            self.textView.frame.origin.y = -keyboardFrame.height
        })
    }
    
    /**
     Called when the keyboard is dismissed
     */
    func keyboardWasDismissed(sender: NSNotification) {
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.textView.frame.origin.y = 0
        })
    }
    
    /**
     Dimiss the keyboard upon pressing the Cancel Button
    */
    func pullDownKeyboard() {
        self.textView.resignFirstResponder()
    }
    
    func clearTextView() {
        self.textView.text = ""
    }
}

