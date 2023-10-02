//import UIKit
//
//class ProfileViewController: UIViewController {
//    
//    @IBOutlet weak var btnLogOut: UIButton!
//    @IBOutlet weak var profileImg: UIImageView!
//    @IBOutlet weak var userLabel: UILabel!
//    @IBOutlet weak var swLanguage: UISwitch!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        btnLogOut.layer.cornerRadius = 5
//        profileImg.frame.size.width = 100
//        profileImg.frame.size.height = 100
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = profileImg.bounds
//        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.systemPink.cgColor, UIColor.yellow.cgColor, UIColor.purple.cgColor]
//        profileImg.layer.cornerRadius = 50
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = UIBezierPath(roundedRect: profileImg.bounds, cornerRadius: 150).cgPath
//        maskLayer.fillColor = UIColor.clear.cgColor
//        maskLayer.strokeColor = UIColor.black.cgColor
//        maskLayer.lineWidth = 3.5
//        gradientLayer.mask = maskLayer
//        profileImg.layer.addSublayer(gradientLayer)
//        
//        handleChange()
//    }
//    
//    @IBAction func swLanguage(_ sender: Any) {
//        if swLanguage.isOn {
//            UserDefaults.standard.set(true, forKey: "storeUser")
//            updateLocalization("en")
//        } else {
//            UserDefaults.standard.set(false, forKey: "storeUser")
//            updateLocalization("km-KH")
//        }
//    }
//    
//    
//    func updateLocalization(_ languageCode: String) {
//        if let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") {
//            let bundle = Bundle(path: path)
//            userLabel.text = "username".localizableString(loc: languageCode, bundle: bundle)
//        } else {
//            userLabel.text = "Error path files"
//        }
//    }
//    
//    func handleChange(){
//        if UserDefaults.standard.bool(forKey: "keyUserDefualt"){
//            swLanguage.setOn(true, animated: false)
//            updateLocalization("en")
//        }else{
//            swLanguage.setOn(false, animated: false)
//            updateLocalization("km-KH")
//        }
//    }
//    
//}
//
//extension String {
//    func localizableString(loc: String, bundle: Bundle? = nil) -> String {
//        if let path = Bundle.main.path(forResource: loc, ofType: "lproj") {
//            let bundle = Bundle(path: path)
//            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//        } else {
//            return self
//        }
//    }
//}
