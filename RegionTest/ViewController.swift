import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    
    var showingAlert = false
    var alert: UIAlertController?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myMap.setUserTrackingMode(.Follow, animated: true)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        
        let hidden = CLLocationCoordinate2D(latitude: 50.719794, longitude: -1.879156)
        let hiddenRegion = CLCircularRegion(center: hidden, radius: 100, identifier: "Hidden")
        locationManager.startMonitoringForRegion(hiddenRegion)
        
        let path = CLLocationCoordinate2D(latitude: 50.718454, longitude: -1.876792)
        let pathRegion = CLCircularRegion(center: path, radius: 100, identifier: "path")
        locationManager.startMonitoringForRegion(pathRegion)
        
        let aruba = CLLocationCoordinate2D(latitude: 50.716244, longitude: -1.875628)
        let arubaRegion = CLCircularRegion(center: aruba, radius: 100, identifier: "aruba")
        locationManager.startMonitoringForRegion(arubaRegion)
        
    }

 

}


extension ViewController: CLLocationManagerDelegate {
   

    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {

        
        if showingAlert == false {
            showingAlert = true
            
            var message = ""
            
            if region.identifier == "aruba" {
                message = "youre at aruba"
            }
            
            if region.identifier == "aruba" {
                message = "youre at aruba"
            }
            
            if region.identifier == "aruba" {
                message = "youre at aruba"
            }
            
            
            
            alert = UIAlertController(title: region.identifier, message: message , preferredStyle: UIAlertControllerStyle.Alert)
            
            alert!.addAction(UIAlertAction(title: "OK", style: .Default, handler: { _ in
                self.showingAlert = false
            }))
            
            alert!.addAction(UIAlertAction(title: "Done", style: .Default, handler: { _ in
                self.showingAlert = false
            }))
            
            presentViewController(alert!, animated: true, completion: nil)
        }

        
    }
    
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        if showingAlert == true {
            if let alert = alert {
                alert.dismissViewControllerAnimated(true, completion: { _ in
                    self.showingAlert = false
                })
                
            }
        }
    }
}





class CustomRegion: CLCircularRegion {
    
    var message: String!
    
    init(center: CLLocationCoordinate2D, radius: CLLocationDistance, identifier: String, message: String) {
        super.init(center: center, radius: radius, identifier: identifier)
        self.message = message
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
