//
//  SearchResultCell.swift
//  AppStoreJsonClone
//
//  Created by Memo Figueredo on 16/3/21.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
//    image
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
//    label
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    //    categoryLabel
        let categoryLabel: UILabel = {
            let categoryLabel = UILabel()
            categoryLabel.text = "Photos & videos"
            return categoryLabel
        }()
    
    //    categoryLabel
        let ratingLabel: UILabel = {
            let ratingLabel = UILabel()
            ratingLabel.text = "9.26M"
            return ratingLabel
        }()
    
    
//    button
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
//    Fuction to create imageView
    lazy var screenhot1ImageView = self.createScreenShotImageView()
    lazy var screenhot2ImageView = self.createScreenShotImageView()
    lazy var screenhot3ImageView = self.createScreenShotImageView()
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        
//     MARK:Stack View contentLabel
//        let labelStackView = UIStackView(arrangedSubviews: [
//            nameLabel, categoryLabel, ratingLabel
//        ])
//        labelStackView.axis = .vertical
    
       let labelStackView  = VerticalStackView(arrangedSubviews: [
            nameLabel, categoryLabel, ratingLabel
        ])
        
//       MARK:Stack View Main
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelStackView, getButton
        ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
//        MARK:screenshotStackView
        let screenshotStackView = UIStackView(arrangedSubviews: [
            screenhot1ImageView,screenhot2ImageView,screenhot3ImageView
        ])
        screenshotStackView.spacing  = 12
        screenshotStackView.distribution = .fillEqually
        
//        MARK:OverallStackView
//        let overallStackView = UIStackView(arrangedSubviews: [
//             infoTopStackView, screenshotStackView
//        ])
//        overallStackView.axis = .vertical
//        overallStackView.spacing = 16
        
        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView, screenshotStackView
        ], spacing: 16)
        
        
        addSubview(overallStackView)
        
//        Contraints with Helpers
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
//        contrainst
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
