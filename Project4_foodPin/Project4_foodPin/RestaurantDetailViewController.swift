//
//  RestaurantDetailViewController.swift
//  Project4_foodPin
//
//  Created by 李名夫 on 5/28/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit

class RestaurantDetailViewController:
UIViewController,UITableViewDelegate,UITableViewDataSource{
    var restaurant:Restaurant!
    
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    
    @IBAction func close(segue:UIStoryboardSegue){}
    @IBAction func ratingButtonTapped(segue: UIStoryboardSegue){
        if let rating = segue.identifier{
            restaurant.isVisited = true
            
            switch rating{
            case "great":restaurant.rating = "Absolutely love it! MUST try."
            case "good":restaurant.rating = "Pretty good."
            case "dislike":restaurant.rating = "I don't like it."
            default: break
            }
        }
        tableView.reloadData()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView?.image = UIImage(named: restaurant.image)
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.2)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.8)
        
        //Enable auto-sizing cell
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableView.automaticDimension
        navigationItem.title = restaurant.name
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview"{
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = restaurant!
        }
    }
    
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I've been here before. \(restaurant.rating)" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    
}
