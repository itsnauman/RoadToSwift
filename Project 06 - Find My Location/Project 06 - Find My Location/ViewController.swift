//
//  ViewController.swift
//  Project 06 - Find My Location
//
//  Created by Nauman Ahmad on 6/20/16.
//  Copyright © 2016 Nauman Ahmad. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    let locationManager = CLLocationManager()
    
    @IBAction func btnFindMyLocation(sender: AnyObject) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if (error != nil) {
                let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
            if placemarks?.count > 0 {
                let pm = placemarks![0]
                self.locationManager.stopUpdatingLocation()
                
                //stop updating location to save battery life
                self.displayLocationInfo(pm)
            }

        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            let locality = containsPlacemark.locality ?? ""
            let postalCode = containsPlacemark.postalCode ?? ""
            let administrativeArea = containsPlacemark.administrativeArea ?? ""
            let country = containsPlacemark.country ?? ""
            
            self.locationLabel.text = "\(locality), \(administrativeArea) \(country) \(postalCode)"
        }
        
    }
}

