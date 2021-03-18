//
//  AppsSearchController.swift
//  AppStoreJsonClone
//
//  Created by Memo Figueredo on 15/3/21.
//

import UIKit

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
    
//    Create struct but pass to other docuemnts
    struct SearchResult: Decodable {
        let resultCount: Int
        let results: [Result]
    }
    
    struct Result: Decodable {
        let trackName: String
        let primaryGenreName: String
    }
    
    fileprivate func fetchItunesApps(){
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        
        guard let url = URL(string: urlString) else { return }
//        fetch data to internet
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            error to requets
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
//            sucess
//            print(data)
//            print(String(data: data!, encoding: .utf8))
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                print(searchResult)
                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
            } catch let jsonErr {
                debugPrint("Failed to decode json:", jsonErr)
            }

            
            
        }.resume() //fires off the requets dispara la solicitud
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
//                CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = ""
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
