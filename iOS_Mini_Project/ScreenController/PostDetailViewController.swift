//import UIKit
//
//class PostDetailViewController: UIViewController {
//    var img: String = ""
//    var postTitle: String = ""
//    var desc: String = ""
//    var author: String = ""
//    var createAt: String = ""
//    
//    @IBOutlet weak var postImg: UIImageView!
//    @IBOutlet weak var titlePost: UILabel!
//    @IBOutlet weak var authorName: UILabel!
//    @IBOutlet weak var createDate: UILabel!
//    @IBOutlet weak var postDesc: UITextView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        if let imgUrl = URL(string: img) {
//            postImg.kf.setImage(with: imgUrl)
//        }
//        createDate.text = createAt
//        titlePost.text = postTitle
//        authorName.text = author
//        postDesc.text = desc
//        
//    }
//}
