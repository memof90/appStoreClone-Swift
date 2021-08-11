//
//  BaseListController.swift
//  AppStoreJsonClone
//
//  Created by Memo Figueredo on 31/3/21.
//

import UIKit


class BaseListController: UICollectionViewController {
    
    //    pass view to tabBar to UICollectionViewController
        init() {
            super.init(collectionViewLayout: UICollectionViewFlowLayout())
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
