//
//  PageViewController.swift
//  Project 05 - Page Views
//
//  Created by Nauman Ahmad on 6/15/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([getStepZero()], direction: .Forward, animated: true, completion: nil)
    }

    func getStepZero() -> ViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("StepZero") as! ViewController
    }
    
    func getStepTwo() -> StepTwoViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("StepTwo") as! StepTwoViewController
    }
    
    func getStepOne() -> StepOneViewController {
        return storyboard?.instantiateViewControllerWithIdentifier("StepOne") as! StepOneViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(ViewController) {
            return getStepOne()
        } else if viewController.isKindOfClass(StepOneViewController) {
            return getStepTwo()
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(StepOneViewController) {
            return getStepZero()
        } else if viewController.isKindOfClass(StepTwoViewController) {
            return getStepOne()
        } else {
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
