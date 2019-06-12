//
//  IconDetailViewController.swift
//  Project6.CollectionView
//
//  Created by 李名夫 on 5/31/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit

class IconDetailViewController: UIViewController {
    
    var icon:Icon?
    
    @IBOutlet var nameLabel:UILabel!{
        didSet {
            nameLabel.text = icon?.name
        }
    }
    @IBOutlet var descriptionLabel:UILabel!{
        didSet {
            descriptionLabel.text = icon?.description
        }
    }
    @IBOutlet var priceLabel:UILabel!{
        didSet {
            if let icon = icon {
            priceLabel.text = "$\(icon.price)"
            }
        }
    }
    @IBOutlet var iconImageView:UIImageView!{
        didSet {
            iconImageView.image = UIImage(named: icon?.imageName ?? "")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
