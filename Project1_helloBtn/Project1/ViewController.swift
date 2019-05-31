//
//  ViewController.swift
//  Project1
//
//  Created by 李名夫 on 5/24/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMessage(sender: UIButton){
        
        var emojiDict:[String:String] = ["👻":"Ghost",
                                        "🤓":"Smart",
                                        "🤖":"Nerdy",
                                        "👾":"Alien Monster"]
        
        let selectedButton = sender
        
        if let wordToLookup = selectedButton.titleLabel?.text{
            
            let meaning = emojiDict[wordToLookup]
            
            let alertController = UIAlertController(title: "Welcome to My App", message: meaning, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
        }
    }
}

