import UIKit
import CoreLocation

import Foundation

class MoneyViewController: UIViewController {
    
    @IBOutlet weak var gifImage: UIImageView!
    var place: String!
    let locationManager = CLLocationManager()
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Money" {
            let vc = segue.destinationViewController as! MoneyViewController
            vc.place = place
            
            gifImage.image = UIImage(named: "gif Hidden")
            
        }
    }
}