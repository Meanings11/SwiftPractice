//
//  ViewController.swift
//  NibPratice is for praticing xib UI Building and try Alamofire 
//
//  Created by 李名夫 on 6/4/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tesla: UITableView!
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tesla.register(UINib(nibName: "TeslaTableViewCell", bundle: nil), forCellReuseIdentifier: "TeslaTableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeslaTableViewCell", for: indexPath) as! TeslaTableViewCell
        
        if let teslaImageURL = NSURL(string: "https://www.tesla.com/sites/default/files/images/presskit/model-s-001.jpg?2017"){
            cell.carImageView.af_setImage(withURL: teslaImageURL as URL)
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

