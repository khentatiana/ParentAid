//
//  MapViewController.swift
//  ParentAid
//
//  Created by Tatiana on 12/4/20.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate {

@IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    var latitude : String?
    var longitude : String?
    var address : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
        // For use when the app is open & in the background
       // locationManager.requestAlwaysAuthorization()
        
        // For use when the app is open
        locationManager.requestWhenInUseAuthorization()
        
        // If location services is enabled get the users location
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuracy here.
            locationManager.startUpdatingLocation()
        }
    }
    
    // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)
        }
    }
    
    // If we have been deined access give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "In order to find kids events near by we need your location",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func updateUI(){
        if let currentLocation = currentLocation{
            //TODO: pupulate the location with coordinate info
            
            
        } else{
            latitude = ""
            longitude = ""
            address = ""
        }
    }
    
}
