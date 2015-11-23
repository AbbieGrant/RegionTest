//
//  ViewController.swift
//  RegionTest
//
//  Created by Rebecca Hughes (i7674769) on 26/10/2015.
//  Copyright © 2015 Rebecca Hughes (i7674769). All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    
    
    let locationManager = CLLocationManager ()

    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myMap.setUserTrackingMode(.Follow, animated: true)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        
        let bournemouthPier = CLLocationCoordinate2D (latitude: 50.715992, longitude: -1.876398)
        let bournemouthPierRegion = CLCircularRegion (center: bournemouthPier, radius: 100, identifier: "bournemouth")
        locationManager.startMonitoringForRegion(bournemouthPierRegion)
        
        
        
        let boscombePier = CLLocationCoordinate2D (latitude: 50.715992, longitude: -1.876398)
        let boscombePierRegion = CLCircularRegion (center: boscombePier, radius: 100, identifier: "boscombe")
        locationManager.startMonitoringForRegion(boscombePierRegion)
        
        
    }

 

}


extension ViewController: CLLocationManagerDelegate {
   
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entering \(region.identifier)")
       
        image.image = UIImage(named: region.identifier)
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
         print("Exiting \(region.identifier)")
    }

}
