//
//  ResearchResultCell.swift
//  CodeLayout
//
//  Created by 李名夫 on 6/6/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit
import SnapKit
import Reusable

class SearchResultCell: UICollectionViewCell,Reusable {
//     static let identifier = "SearchResultCellId"
    lazy var screenshot1ImageView = createScreenshotImageView()
    lazy var screenshot2ImageView = createScreenshotImageView()
    lazy var screenshot3ImageView = createScreenshotImageView()
    
    
    
//    override var reuseIdentifier: String?{
//        return SearchResultCell.identifier
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    
    func setUpStackView(){
        let vStackView = UIStackView(arrangedSubviews: [
            nameLabel, categoryLabel,ratingsLabel
            ])
        vStackView.axis = .vertical
        
        
        
        let infoTopStackView = UIStackView(arrangedSubviews:[
            appIconImageView,
            vStackView,
            getButton
            ])
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .leading
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView,screenshot2ImageView,screenshot3ImageView])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let overallStackView = UIStackView(arrangedSubviews: [infoTopStackView,screenshotStackView])
        overallStackView.axis = .vertical
        overallStackView.spacing = 16
        
        
        addSubview(overallStackView)
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        
        overallStackView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(20)
            make.bottom.equalTo(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
    }
    
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        
//        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
//        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.snp.makeConstraints{ (make) in
            make.size.equalTo(CGSize(width: 64, height: 64))
        }

        
        iv.layer.cornerRadius = 12
       return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "应用名称"
        return label
    }()
    
    let categoryLabel: UILabel = {
       let label = UILabel()
        label.text = "生产力工具" 
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "54.87M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("取得", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
//        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.snp.makeConstraints{ (make) in
            make.size.equalTo(CGSize(width: 80, height: 32))
        }
        
      
        button.layer.cornerRadius = 16
        return button
    }()
    
}

