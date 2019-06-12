//
//  ReviewViewController.swift
//  Project4_foodPin
//
//  Created by 李名夫 on 5/29/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit


class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var reviewRestaurantImageView: UIImageView!
    
    var restaurant:RestaurantMO!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewRestaurantImageView.image = UIImage(data: restaurant.image!)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
