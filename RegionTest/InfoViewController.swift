import UIKit
import CoreLocation


class InfoViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    var place: String!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(place)
        
        
        mainImage.image = UIImage(named: "video "+place)
        
        
//       locationManager.requestAlwaysAuthorization()
  //      locationManager.delegate = self
        
  //      let hidden = CLLocationCoordinate2D(latitude: 50.718454, longitude: -1.876792)
  //      let hiddenRegion = CLCircularRegion(center: hidden, radius: 100, identifier: "Hidden")
  //      locationManager.startMonitoringForRegion(hiddenRegion)
       //     let path = CLLocationCoordinate2D(latitude: 50.716244, longitude: -1.875628)
  //      let pathRegion = CLCircularRegion(center: path, radius: 100, identifier: "Path")
   //     locationManager.startMonitoringForRegion(pathRegion)
        
    //    let aruba = CLLocationCoordinate2D(latitude: 50.719794, longitude: -1.879156)
    //    let arubaRegion = CLCircularRegion(center: aruba, radius: 100, identifier: "Aruba")
    //    locationManager.startMonitoringForRegion(arubaRegion)
        
        
    
    }
   
}
