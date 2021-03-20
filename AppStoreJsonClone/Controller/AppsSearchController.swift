//
//  AppsSearchController.swift
//  AppStoreJsonClone
//
//  Created by Memo Figueredo on 15/3/21.
//

import UIKit
import SDWebImage

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
//    identifier cell
    fileprivate let cellId = "id1234"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
//        allow to register identifier cell
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
//        Fuction to pass data Api Itunes
        fetchItunesApps()
    }
    
    fileprivate var appResults = [Result]()
    
//    1 - populate our cell with our itunes api data
//    2 - Extract this fuctionItunes Appd OutSide of this controller File
    
    fileprivate func fetchItunesApps(){
        Service.shared.fetchApps { (results, err) in
            
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
            self.appResults = results
    //                reload data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
        }
        }
//        we need to get back our search results somehow
//        use a completion block
//        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
//
//        guard let url = URL(string: urlString) else { return }
////        fetch data to internet
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
////            error to requets
//            if let err = err {
//                print("Failed to fetch apps:", err)
//                return
//            }
//
////            sucess
////            print(data)
////            print(String(data: data!, encoding: .utf8))
//            guard let data = data else { return }
//
//            do {
//                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
////                print(searchResult)
////                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
//                self.appResults = searchResult.results
//
////                reload data
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//
//            } catch let jsonErr {
//                debugPrint("Failed to decode json:", jsonErr)
//            }
//
//
//
//        }.resume() //fires off the requets dispara la solicitud
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
//                CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.appResult = appResults[indexPath.item]
//        data to saw into app
//        cell.nameLabel.text = "Here is My App"
//        let appResult = appResults[indexPath.row]
//        let appResult = appResults[indexPath.item]
//        cell.nameLabel.text = appResult.trackName
//        cell.categoryLabel.text = appResult.primaryGenreName
//        cell.ratingLabel.text = "\(appResult.averageUserRating)"
//        
////        icon and screen shots
//        let url = URL(string: appResult.artworkUrl100)
//        cell.appIconImageView.sd_setImage(with: url)
////        screen shots
////        cell.screenhot1ImageView
//        cell.screenhot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
//        if appResult.screenshotUrls.count > 1 {
//            cell.screenhot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
//        }
//        if appResult.screenshotUrls.count > 2 {
//            cell.screenhot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
//        }
//        cell.appResult = appResults[indexPath.item]
//        cell.appResult = appResult
        
        return cell
    }
    
    
//    pass view to tabBar to UICollectionViewController
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
