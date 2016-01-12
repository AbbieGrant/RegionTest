import UIKit
import MapKit
import CoreLocation
import ImageIO

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

extension UIImage {
    
    public class func gifWithData(data: NSData) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data, nil) else {
            print("SwiftGif: Source for the image does not exist")
            return nil
        }
        return UIImage.animatedImageWithSource(source)
    }
    
    public class func gifWithName(name: String) -> UIImage? {
        guard let bundleURL = NSBundle.mainBundle().URLForResource(name, withExtension: "gif") else {
            print("SwiftGif: This image named \"\(name)\" does not exist")
            return nil
        }
        guard let imageData = NSData(contentsOfURL: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        return gifWithData(imageData)
    }
    
    class func delayForImageAtIndex(index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1
        
        // Get dictionaries
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties: CFDictionaryRef = unsafeBitCast(
            CFDictionaryGetValue(cfProperties,
                unsafeAddressOf(kCGImagePropertyGIFDictionary)),
            CFDictionary.self)
        
        // Get delay time
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                unsafeAddressOf(kCGImagePropertyGIFUnclampedDelayTime)),
            AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                unsafeAddressOf(kCGImagePropertyGIFDelayTime)), AnyObject.self)
        }
        
        delay = delayObject as! Double
        
        if delay < 0.1 {
            delay = 0.1 // Make sure they're not too fast
        }
        
        return delay
    }
    
    class func gcdForPair(var a: Int?, var _ b: Int?) -> Int {
        // Check if one of them is nil
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        // Swap for modulo
        if a < b {
            let c = a
            a = b
            b = c
        }
        
        // Get greatest common divisor
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b! // Found it
            } else {
                a = b
                b = rest
            }
        }
    }
    
    class func gcdForArray(array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(val, gcd)
        }
        
        return gcd
    }
    
    class func animatedImageWithSource(source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImageRef]()
        var delays = [Int]()
        
        // Fill arrays
        for i in 0..<count {
            // Add image
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            
            // At it's delay in cs
            let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
                source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }
        
        // Calculate full duration
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
            }()
        
        // Get frames
        let gcd = gcdForArray(delays)
        var frames = [UIImage]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(CGImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        
        // Heyhey
        let animation = UIImage.animatedImageWithImages(frames,
            duration: Double(duration) / 1000.0)
        
        return animation
    }
    
}

