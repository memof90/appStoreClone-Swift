//
//  SearchResult.swift
//  AppStoreJsonClone
//
//  Created by Memo Figueredo on 18/3/21.
//

import Foundation

//    Create struct but pass to other docuemnts
    struct SearchResult: Decodable {
        let resultCount: Int
        let results: [Result]
    }
    
    struct Result: Decodable {
        let trackName: String
        let primaryGenreName: String
        let averageUserRating: Float
    }
