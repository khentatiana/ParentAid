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
//    let locationManager = CLLocationManager()
//    var currentCoordinate: CLLocationCoordinate2D?
//
@IBOutlet weak var mapView: MKMapView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        locationManagerDidChangeAuthorization(locationManager)
//        // Do any additional setup after loading the view.
//    }
//
////    private func configureLocationServices() {
////        locationManager.delegate = self
////        let status = CLLocationManager.authorizationStatus()
////
////        if status == .notDetermined {
////            locationManager.requestAlwaysAuthorization()
////        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
////           beginLocationUpdates(locationManager: locationManager)
////        }
////    }
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        locationManager.delegate = self
//        if #available(iOS 14.0, *) {
//               switch locationManager.authorizationStatus {
//                   case .authorizedAlways , .authorizedWhenInUse:
//                       break
//                   case .notDetermined , .denied , .restricted:
//                       break
//                   default:
//                       break
//               }
//
//               switch locationManager.accuracyAuthorization {
//                   case .fullAccuracy:
//                       break
//                   case .reducedAccuracy:
//                       break
//                   default:
//                       break
//               }
//           }
//    }
//
//    func beginLocationUpdates(locationManager: CLLocationManager) {
//        mapView.showsUserLocation = true
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//    }
//
//     func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
//        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
//        mapView.setRegion(zoomRegion, animated: true)
//    }
//}
//
//extension MapViewController: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("Did get latest location")
//
//        guard let latestLocation = locations.first else { return }
//
//        if currentCoordinate == nil {
//            zoomToLatestLocation(with: latestLocation.coordinate)
//        }
//
//        currentCoordinate = latestLocation.coordinate
//    }
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//       print("The status changed")
//        if status == .authorizedAlways || status == .authorizedWhenInUse {
//            beginLocationUpdates(locationManager: manager)
//        }
//    }
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
                                                message: "In order to deliver pizza we need your location",
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
    
}
