//
//  RestaurantTableViewController.swift
//  Project4_foodPin
//
//  Created by 李名夫 on 5/27/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit
import CoreData


class RestaurantTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchResultsUpdating {
    
    var restaurants:[RestaurantMO] = []
    var fetchResultController: NSFetchedResultsController<RestaurantMO>!
    
    //search content
    var searchController: UISearchController!
    var searchResults:[RestaurantMO] = []
    
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue){}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //search bar setting
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor(red: 218.0/255.0, green:
            100.0/255.0, blue: 70.0/255.0, alpha: 1.0)
        searchController.searchBar.placeholder = "Searching Restaurant..."
        
        
        //nav bar setting
        setNeedsStatusBarAppearanceUpdate()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //tableview ui
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        
        
        //Fetch data from data store
        let fetchRequest: NSFetchRequest<RestaurantMO> = RestaurantMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let context = appDelegate.persistentContainer.viewContext
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        
        do{
            try fetchResultController.performFetch()
            if let fetchObjects = fetchResultController.fetchedObjects{
                restaurants = fetchObjects
            }
            
        }catch{
            print(error)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive{
            return searchResults.count
        }
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true
        
        let restaurant = (searchController.isActive) ? searchResults[indexPath.row]:restaurants[indexPath.row]
        
        cell.nameLabel?.text = restaurant.name
        cell.thumbnailImageView?.image = UIImage(data: restaurant.image!)
        cell.locationLabel?.text = restaurant.location
        cell.typeLabel?.text = restaurant.type
        
        cell.accessoryType =  restaurant.isVisited ? .checkmark:.none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive{
            return false
        }else{
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! RestaurantDetailViewController
                
                destinationController.restaurant = (searchController.isActive) ? searchResults[indexPath.row]:restaurants[indexPath.row]
            }
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        let callActionHandler = { (action:UIAlertAction!)->Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//
//        let callAction = UIAlertAction(title: "Call" + "123-000-" + ((indexPath.row > 9) ? "0\(indexPath.row)" : "00\(indexPath.row)"), style: .default, handler: callActionHandler)
//
//        let checkInAction = UIAlertAction(title: "Check In", style: .default, handler: {(action: UIAlertAction)->Void in
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
//            self.restaurantIsVisted[indexPath.row] = true
//        })
//
//        let undoCheckInAction = UIAlertAction(title: "Undo Check In", style: .default, handler: {(action: UIAlertAction)->Void in
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .none
//            self.restaurantIsVisted[indexPath.row] = false
//        })
//
//        restaurantIsVisted[indexPath.row] ? optionMenu.addAction(undoCheckInAction) : optionMenu.addAction(checkInAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        present(optionMenu, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: {(action,indexPath)-> Void in

            let defaultatText = "Just Checking at \(self.restaurants[indexPath.row].name!)"
            
            if let imageToShare = UIImage(data: self.restaurants[indexPath.row].image!){
                
                let activityController = UIActivityViewController(activityItems: [defaultatText,imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        //where define action
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action,indexPath)-> Void in
            
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
                let context = appDelegate.persistentContainer.viewContext
                let restaurantToDelete = self.fetchResultController.object(at: indexPath)
                context.delete(restaurantToDelete)
                
                appDelegate.saveContext()
            }
        })
        
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0,
                                              blue: 99.0/255.0, alpha: 1.0)
        return [deleteAction,shareAction]
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
                tableView.reloadData()
        }
        if let fetchedObjects = controller.fetchedObjects {
            restaurants = fetchedObjects as! [RestaurantMO]
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func filterContent(for searchText: String){
        searchResults = restaurants.filter({ (restaurant) -> Bool in
            if let name = restaurant.name{
                    let isMatch = name.localizedCaseInsensitiveContains(searchText)
                    return isMatch
            }
            return false
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
}

