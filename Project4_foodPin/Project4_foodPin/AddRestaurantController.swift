//
//  AddRestaurantController.swift
//  Project4_foodPin
//
//  Created by 李名夫 on 5/29/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameForm: UITextField!
    @IBOutlet var typeForm: UITextField!
    @IBOutlet var locationForm: UITextField!
    @IBOutlet var yesBeenButton: UIButton!
    @IBOutlet var noBeenButton: UIButton!
    
    var name:String = ""
    var type:String = ""
    var location:String = ""
    var isVisited: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                //？
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
                photoImageView.image = selectedImage
                photoImageView.contentMode = .scaleAspectFill
                photoImageView.clipsToBounds = true
        }
        
        
//        let leadingConstriant = NSLayoutConstraint(item: photoImageView!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: photoImageView.superview, attribute:NSLayoutConstraint.Attribute.leading , multiplier: 1, constant: 0)
//        leadingConstriant.isActive = true
//
//       let trailingConstriant = NSLayoutConstraint(item: photoImageView!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: photoImageView.superview, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
//        trailingConstriant.isActive = true
//
//        let topConstraint = NSLayoutConstraint(item: photoImageView!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: photoImageView.superview, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
//        topConstraint.isActive = true
//
//        let bottomContraint = NSLayoutConstraint(item: photoImageView!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: photoImageView.superview, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
//        bottomContraint.isActive = true

        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func toggleBeenHereButton(sender: UIButton){
        //Yes button clicked
        if sender == yesBeenButton{
             isVisited = true
            yesBeenButton.backgroundColor = UIColor.red
            noBeenButton.backgroundColor = UIColor.gray
            
        }else if sender == noBeenButton{
             isVisited = false
            yesBeenButton.backgroundColor = UIColor.gray
            noBeenButton.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func saveRestaurantButton(sender: UIButton){
        name = nameForm.text!
        type = typeForm.text!
        location = locationForm.text!
        print(name)
        print(type)
        print(location)
        print(isVisited ? "YES":"NO")
        
        if(name == "" || type == "" || location == ""){
            let alertMessage = UIAlertController(title: "Oops!", message: "We can't proceed because one of the field is blank. Please note that all fields are required.", preferredStyle: .alert)
                        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alertMessage, animated: true, completion: nil)
        }else{
            
            performSegue(withIdentifier: "addNewRestaurant", sender: self)
        }
    }
    
}
