////
////  PostViewController.swift
////  iOS_Mini_Project
////
////  Created by PVH_002 on 20/9/23.
////
//
//import UIKit
//import Alamofire
//
//class PostViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
//    
//    @IBOutlet weak var btnSubmit: UIButton!
//    @IBOutlet weak var postRequestImg: UIImageView!
//    @IBOutlet weak var postRequestTitle: UITextField!
//    @IBOutlet weak var postRequestDesc: UITextView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        postRequestDesc.text = ""
//        btnSubmit.layer.cornerRadius = 5
//        
//    }
//    
//    func showAlert(title: String, message: String) {
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default) { [self] _ in
//            postRequestTitle.text = ""
//            postRequestDesc.text = ""
//            postRequestImg.image = UIImage(named: "placeholder-image")
//        }
//        alertController.addAction(okAction)
//        
//        // Present the alert controller
//        self.present(alertController, animated: true, completion: nil)
//    }
//    
//    @IBAction func chooseImg(_ sender: Any) {
//        let vc = UIImagePickerController()
//        vc.sourceType = .photoLibrary
//        vc.delegate = self
//        vc.allowsEditing = true
//        present(vc, animated: true)
//    }
//    
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
//            postRequestImg.image = image
//            if let imgData = image.pngData() {
//                upLoadImg(img: imgData)
//            }
//            print("image to upload to api\(image)")
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//    
//    // handle upload image
//    var image: String?
//    func upLoadImg(img: Data) {
//        let baseUrl = "http://8.219.139.67:6654/api/v1/files"
//        let headers : HTTPHeaders = ["Content-Type" : "multipart/form-data"]
//        AF.upload(multipartFormData: { multipartFormData in
//            multipartFormData.append(img, withName: "files", fileName: ".png", mimeType: "image/*")
//        }, to: baseUrl, headers: headers).responseJSON { [self]
//            response in
//            switch response.result {
//            case .success(_):
//                let responseImgFromApi = try? JSONDecoder().decode(ResponseImg.self, from: response.data!)
//                image = (responseImgFromApi?.payload![0])!
//            case .failure(_):
//                break
//            }
//        }
//    }
//    
//    // handle post article
//    func postArticle(postArticle: PostModel, completionHandler: @escaping (Bool) -> ()) {
//        let baseUrl = "http://8.219.139.67:6654/api/v1/articles"
//        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
//        AF.request(baseUrl, method: .post, parameters: postArticle, encoder: JSONParameterEncoder.default, headers: headers).response { response in
//            switch response.result {
//            case .success(let data):
//                do {
//                    let jsonRes = try JSONSerialization.jsonObject(with: data!, options: [])
//                    if response.response?.statusCode == 200 {
//                        completionHandler(true)
//                    } else {
//                        completionHandler(false)
//                    }
//                    print("this is post response \(jsonRes)")
//                } catch {
//                    print(error.localizedDescription)
//                    completionHandler(false)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//                completionHandler(false)
//            }
//        }
//    }
//    
//    
//    @IBAction func btnSubmit(_ sender: Any) {
//        guard let image = self.image else {return showAlert(title: "Alert", message: "Pleae choose image")}
//        guard let title = self.postRequestTitle.text else {return}
//        guard let desc = self.postRequestDesc.text else {return}
//        let postData = PostModel(title: title, description: desc, categories: ["Article"], teacherID: "4eeaa3b2-a988-46b1-87af-95ce42d5a299", isPublished: true, thumbnail: image)
//        postArticle(postArticle: postData) { [self] (isSuccess) in
//            if isSuccess {
//                showAlert(title: "Alert", message: "Post Successfully!!!")
//            } else {
//                showAlert(title: "Alert", message: "Post Failed")
//            }
//        }
//    }
//    
//    
//}
//
//
//// MARK: - Model for handle image upload
//struct ResponseImg: Codable {
//    var message: String?
//    var statsus: String?
//    var payload: [String]?
//}
//
//// MARK: - Model for handle post article
//struct PostModel: Codable {
//    let title, description: String
//    let categories: [String]
//    let teacherID: String
//    let isPublished: Bool
//    let thumbnail: String
//    
//    enum CodingKeys: String, CodingKey {
//        case title, description, categories
//        case teacherID = "teacherId"
//        case isPublished, thumbnail
//    }
//    
//}
