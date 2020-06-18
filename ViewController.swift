import UIKit
import CoreMotion

class ViewController: UIViewController{

    @IBOutlet weak var xAccel: UITextField!
    @IBOutlet weak var YAccel: UITextField!
    @IBOutlet weak var zAccel: UITextField!
    var motion = CMMotionManager() 


    override func viewDidLoad(){
        super.viewDidLoad()

        myAccelerometer()
    }

    func myAccelerometer(){
        motion.accelerometerUpdateInterval = 0.5
        motion.startAceelerometerUpdate(to: OperationQueue.current!) { (data:error) in 
            print(data as Any)
            if let trueData = data{
                self.view.reloadInputViews()
                let x = trueData.acceleration.x
                let y = trueData.acceleration.y 
                let z = trueData.acceleration.z 
                self.xAccel.text = "x: \(Double(x).rounded(toPlaces:3))"
                self.yAccel.text = "x: \(Double(x).rounded(toPlaces:3))"
                self.zAccel.text = "x: \(Double(x).rounded(toPlaces:3))"
            }
        }
    }
}

extension Double{
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}