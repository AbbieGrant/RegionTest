import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    
    var showingAlert = false
    var alert: UIAlertController?
    var place: String!
    
    let locationManager = CLLocationManager()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myMap.setUserTrackingMode(.Follow, animated: true)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        let hidden = CLLocationCoordinate2D(latitude: 50.718454, longitude: -1.876792)
        let hiddenRegion = CLCircularRegion(center: hidden, radius: 100, identifier: "Hidden")
        locationManager.startMonitoringForRegion(hiddenRegion)
        
        let path = CLLocationCoordinate2D(latitude: 50.716244, longitude: -1.875628)
        let pathRegion = CLCircularRegion(center: path, radius: 100, identifier: "Path")
        locationManager.startMonitoringForRegion(pathRegion)
        
        let aruba = CLLocationCoordinate2D(latitude: 50.719794, longitude: -1.879156)
        let arubaRegion = CLCircularRegion(center: aruba, radius: 100, identifier: "Aruba")
        locationManager.startMonitoringForRegion(arubaRegion)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RegionInfo" {
            
            let vc = segue.destinationViewController as! InfoViewController
            vc.place = place
            
        }
    }

}


extension ViewController: CLLocationManagerDelegate {
   

    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {

        place = region.identifier
        
        if showingAlert == false {
            showingAlert = true
            if region.identifier == "Hidden" {
                
                alert = UIAlertController(title: "You decided to go through with it", message: nil, preferredStyle: .Alert)
                let alertAction = UIAlertAction(title: "Countine...", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                    self.showingAlert = false
                    self.performSegueWithIdentifier("RegionInfo", sender: self)
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                    self.showingAlert = false
                }
                alert!.addAction(cancelAction)
                alert!.addAction(alertAction)
                presentViewController(alert!, animated: true) { () -> Void in }
            }
            
            if region.identifier == "Path" {
                
                alert = UIAlertController(title: "You do know we can hear and see everything", message: nil, preferredStyle: .Alert)
                let alertAction = UIAlertAction(title: "Countine...", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                    self.showingAlert = false
                    self.performSegueWithIdentifier("RegionInfo", sender: self)
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                    self.showingAlert = false
                }
                alert!.addAction(cancelAction)
                alert!.addAction(alertAction)
                presentViewController(alert!, animated: true) { () -> Void in }
            }
            
            if region.identifier == "Aruba" {
                
                alert = UIAlertController(title: "Money, Money, Money", message: nil, preferredStyle: .Alert)
                let alertAction = UIAlertAction(title: "Countine...", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                    self.showingAlert = false
                    self.performSegueWithIdentifier("RegionInfo", sender: self)
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                    self.showingAlert = false
                }
                alert!.addAction(cancelAction)
                alert!.addAction(alertAction)
                presentViewController(alert!, animated: true) { () -> Void in }
            }
            
            
        }

        
    }
    
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        //print("Leaving\(region.identifier)")
        //for point in points {
            //if point.name ==region.identifier {
                //point.lock()
            //}
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