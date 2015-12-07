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
        
        
        let hidden = CLLocationCoordinate2D (latitude: 50.719794, longitude: -1.879156)
        let hiddenRegion = CLCircularRegion (center: hidden, radius: 100, identifier: "hidden")
        locationManager.startMonitoringForRegion(hiddenRegion)
        
        let path = CLLocationCoordinate2D (latitude: 50.718454, longitude: -1.876792)
        let pathRegion = CLCircularRegion (center: path, radius: 100, identifier: "path")
        locationManager.startMonitoringForRegion(pathRegion)
        
        let aruba = CLLocationCoordinate2D (latitude: 50.716244, longitude: -1.875628)
        let arubaRegion = CLCircularRegion (center: aruba, radius: 100, identifier: "aruba")
        locationManager.startMonitoringForRegion(arubaRegion)
        
        
    }

 

}


extension ViewController: CLLocationManagerDelegate {
   
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entering \(region.identifier)")
    
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
         print("Exiting \(region.identifier)")
    }

}
