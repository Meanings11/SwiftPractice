//
//  TeslaTableViewCell.swift
//  NibPratice
//
//  Created by 李名夫 on 6/4/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit

class TeslaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
