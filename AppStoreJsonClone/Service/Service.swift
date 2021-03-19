//
//  Service.swift
//  AppStoreJsonClone
//
//  Created by Memo Figueredo on 18/3/21.
//

import Foundation


class Service {
    static let shared = Service() //singleton object
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        print("Fetching itunes from Service Layer")
                let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        
                guard let url = URL(string: urlString) else { return }
        //        fetch data to internet
                URLSession.shared.dataTask(with: url) { (data, resp, err) in
        //            error to requets
                    if let err = err {
                        print("Failed to fetch apps:", err)
                        completion([], nil)
                        return
                    }
        
        //            sucess
        //            print(data)
        //            print(String(data: data!, encoding: .utf8))
                    guard let data = data else { return }
        
                    do {
                        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                            print(searchResult)
                        completion(searchResult.results, nil)
                       
        
                    } catch let jsonErr {
                        debugPrint("Failed to decode json:", jsonErr)
                        completion([], jsonErr)
                    }
        
        
        
                }.resume() //fires off the requets dispara la solicitud
    }
}
