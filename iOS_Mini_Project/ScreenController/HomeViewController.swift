//import UIKit
//import Alamofire
//import Kingfisher
//
//class HomeViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var searchBar: UISearchBar!
//    
//    var articles: Articles?
//    var currentPage = 1
//    let pageSize = 10
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        searchBar.searchTextField.clipsToBounds = true
//        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
//        searchBar.searchTextField.layer.masksToBounds = true
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        loadData(pageNo: currentPage)
//    }
//    
//    func loadData(pageNo: Int) {
//        let urlString = "http://8.219.139.67:6654/api/v1/articles?page=\(pageNo)&size=\(pageSize)"
//        
//        AF.request(urlString).responseDecodable(of: Articles.self) { [weak self] response in
//            guard let self = self else { return }
//            
//            switch response.result {
//            case .success(let articlesResponse):
//                if self.currentPage == 1 {
//                    self.articles = articlesResponse
//                } else {
//                    self.articles?.payload.append(contentsOf: articlesResponse.payload)
//                }
//                
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//                
//            case .failure(let error):
//                print("Error in JSON parsing: \(error)")
//            }
//        }
//    }
//}
//
//extension HomeViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let articles = articles else {
//            return
//        }
//
//        let vc = storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as! PostDetailViewController
//        vc.img = articles.payload[indexPath.row].thumbnail
//        vc.postTitle = articles.payload[indexPath.row].title
//        vc.author = articles.payload[indexPath.row].teacher.username
//        vc.desc = articles.payload[indexPath.row].description
//        
//        // date format
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
//        if let date = dateFormatter.date(from: articles.payload[indexPath.row].createdDate) {
//            dateFormatter.dateFormat = "EEE h:mm a"
//            let formattedDate = dateFormatter.string(from: date)
//            vc.createAt = formattedDate
//        } else {
//            print("Failed to parse the date")
//        }
//        
//        navigationController?.pushViewController(vc, animated: true)
//    }
//}
//
//extension HomeViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return articles?.payload.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        
//        if let article = articles?.payload[indexPath.row] {
//            if article.title == "" {
//                cell.postTitle.text = "No title"
//            } else {
//                cell.postTitle.text = article.title
//            }
//            
//            cell.postDesc.text = article.description
//            cell.profile.text = article.teacher.username
//            
//            // format date
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
//            if let date = dateFormatter.date(from: article.createdDate) {
//                dateFormatter.dateFormat = "EEE h:mm a"
//                let formattedDate = dateFormatter.string(from: date)
//                cell.postAt.text = formattedDate
//            } else {
//                print("Failed to parse the date")
//            }
//            
//            // pass image
//            if let thumbnailURL = URL(string: article.thumbnail) {
//                cell.postImg.kf.setImage(with: thumbnailURL)
//            }
//        }
//        return cell
//    }
//}
//
//extension HomeViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        let height = scrollView.frame.size.height
//        
//        if offsetY > contentHeight - height {
//            currentPage += 1
//            loadData(pageNo: currentPage)
//        }
//    }
//}
