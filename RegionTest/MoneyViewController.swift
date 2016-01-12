//import UIKit
//import CoreLocation
//
//import Foundation
//
//class MoneyViewController: UIViewController {
//    
//    @IBOutlet weak var img0: UIImageView!
//   
//    var currentImage = 2
//
//    
//    let images = [
//    UIImage (named: "part1"),UIImage (named: "part2"),UIImage (named: "part3"),UIImage (named: "part4")]
//    @IBAction func array(sender: AnyObject) {
//        if currentImage < images.count - 1 {
//            currentImage++
//            img0.image = images[currentImage]
//            
//        }
//    }
//    @IBOutlet weak var gifImage: UIImageView!
//    var place: String!
//    let locationManager = CLLocationManager()
//    
//  override func viewDidLoad() {
//      super.viewDidLoad()
//    print("loaded")
//   }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "Money" {
//            let vc = segue.destinationViewController as! MoneyViewController
//            vc.place = place
//            
//            gifImage.image = UIImage(named: "gif Hidden")
//            
//        }
//    }
//}