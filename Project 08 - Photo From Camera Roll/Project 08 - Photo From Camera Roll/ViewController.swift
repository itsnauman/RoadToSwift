//
//  ViewController.swift
//  Project 08 - Photo From Camera Roll
//
//  Created by Nauman Ahmad on 6/22/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textView: UITextView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image Picker Configuration
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        
        // Set keyboard observers
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWasShown), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWasDismissed), name: UIKeyboardWillHideNotification, object: nil)
        
        let numberToolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        let cameraBtn = UIBarButtonItem(barButtonSystemItem: .Camera, target: nil, action: #selector(ViewController.displayImagePicker))
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
    
    func displayImagePicker() {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // Create and NSTextAttachment and add your image to it.
        let attachment = NSTextAttachment()
        attachment.image = image
        let attString = NSAttributedString(attachment: attachment)
        
        // Resize the image to the size of the text view
        let oldWidth = attachment.image!.size.width
        let scaleFactor = oldWidth / (textView.frame.size.width - 10)
        attachment.image = UIImage(CGImage: attachment.image!.CGImage!, scale: scaleFactor, orientation: .Up)
        
        // Insert image at the end of the text view
        textView.textStorage.insertAttributedString(attString, atIndex: textView.selectedRange.location)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

