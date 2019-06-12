//
//  IconCollectionViewController.swift
//  Project6.CollectionView
//
//  Created by 李名夫 on 5/31/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit
import Social

private let reuseIdentifier = "Cell"

class IconCollectionViewController: UICollectionViewController {
    
    private var shareEnabled = false
    private var selectedIcons:[Icon] = []
    
    @IBOutlet var shareButton: UIBarButtonItem!

    private var iconSet: [Icon] = [ Icon(name: "Candle icon", imageName: "candle", description: "Halloween icons designed by Tania Raskalova.", price: 3.99, isFeatured: false),
                                    Icon(name: "Cat icon", imageName: "cat", description: "Halloween icon designed by Tania Raskalova.", price: 2.99, isFeatured: true),
                                    Icon(name: "dribbble", imageName: "dribbble", description: "Halloween icon designed by Tania Raskalova.", price: 1.99, isFeatured: false),
                                    Icon(name: "Ghost icon", imageName: "ghost", description: "Halloween icon designed by Tania Raskalova.", price: 4.99, isFeatured: false),
                                    Icon(name: "Hat icon", imageName: "hat", description: "Halloween icon designed by Tania Raskalova.", price: 2.99, isFeatured: false),
                                    Icon(name: "Owl icon", imageName: "owl", description: "Halloween icon designed by Tania Raskalova.", price: 5.99, isFeatured: true),
                                    Icon(name: "Pot icon", imageName: "pot", description: "Halloween icon designed by Tania Raskalova.", price: 1.99, isFeatured: false),
                                    Icon(name: "Pumkin icon", imageName: "pumkin", description: "Halloween icon designed by Tania Raskalova.", price: 0.99, isFeatured: false),
                                    Icon(name: "RIP icon", imageName: "rip", description: "Halloween icon designed by Tania Raskalova.", price: 7.99, isFeatured: false),
                                    Icon(name: "Skull icon", imageName: "skull", description: "Halloween icon designed by Tania Raskalova.", price: 8.99, isFeatured: false),
                                    Icon(name: "Sky icon", imageName: "sky", description: "Halloween icon designed by Tania Raskalova.", price: 0.99, isFeatured: false),
                                    Icon(name: "Toxic icon", imageName: "toxic", description: "Halloween icon designed by Tania Raskalova.", price: 2.99, isFeatured: false),
                                    Icon(name: "Book icon", imageName: "ic_book", description: "Colorful icon designed by Marin Begović.", price: 2.99, isFeatured: false),
                                    Icon(name: "Backpack icon", imageName: "ic_backpack", description: "Colorful icon designed by Marin Begović.", price: 3.99, isFeatured: false),
                                    Icon(name: "Camera icon", imageName: "ic_camera", description: "Colorful camera icon designed by Marin Begović.", price: 4.99, isFeatured: false),
                                    Icon(name: "Coffee icon", imageName: "ic_coffee", description: "Colorful icon designed by Marin Begović.", price: 3.99, isFeatured: true),
                                    Icon(name: "Glasses icon", imageName: "ic_glasses", description: "Colorful icon designed by Marin Begović.", price: 3.99, isFeatured: false),
                                    Icon(name: "Icecream icon", imageName: "ic_ice_cream", description: "Colorful icon designed by Marin Begović.", price: 4.99, isFeatured: false),
                                    Icon(name: "Smoking pipe icon", imageName: "ic_smoking_pipe", description: "Colorful icon designed by Marin Begović.", price: 6.99, isFeatured: false),
                                    Icon(name: "Vespa icon", imageName: "ic_vespa", description: "Colorful icon designed by Marin Begović.", price: 9.99, isFeatured: false)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

 
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return iconSet.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! IconCollectionViewCell
    
        // Configure the cell
        let icon = iconSet[indexPath.row]
        cell.iconImageView.image = UIImage(named: icon.imageName)
        cell.iconPriceLabel.text = "$\(icon.price)"
        
        cell.backgroundView = (icon.isFeatured) ? UIImageView(image:UIImage(named:"feature-bg")):nil
        cell.selectedBackgroundView = UIImageView(image: UIImage(named: "icon-selected"))
       
        return cell
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender:Any?){
            if segue.identifier == "showIconDetail"{
                if let indexPaths = collectionView?.indexPathsForSelectedItems{
                    let destinationController = segue.destination as! IconDetailViewController
                        destinationController.icon = iconSet[indexPaths[0].row]
                        collectionView?.deselectItem(at: indexPaths[0], animated: false)
                    
                    }
                }
            }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard shareEnabled else{
            return
        }
        
        let selectedIcon = iconSet[indexPath.row]
        selectedIcons.append(selectedIcon)
        
     
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectedIcon = iconSet[indexPath.row]
        
        if let index = selectedIcons.firstIndex(where: {$0.name == deselectedIcon.name}){
            selectedIcons.remove(at: index)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showIconDetail"{
            if shareEnabled{
                return false
            }
        }
        return true
    }
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue){}
    @IBAction func shareButtonTapped(sender: AnyObject){
        
        if shareEnabled{
            
            if selectedIcons.count > 0 {
                print("sharing tweet")
            }
            
            //deselect all item
            if let indexPaths = collectionView?.indexPathsForSelectedItems{
                for indexPath in indexPaths{
                    collectionView?.deselectItem(at: indexPath, animated: false)
                }
            }
            selectedIcons.removeAll()
            
            //changing sharing mode to no
            shareEnabled = false
            sender.setTitle("Share", for: .normal)
            collectionView?.allowsMultipleSelection = false
            shareButton.style = .plain
            
        }else{
            shareEnabled = true
            sender.setTitle("Done", for: .normal)
            collectionView?.allowsMultipleSelection = true
            shareButton.style = .done
        }
    }

    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
