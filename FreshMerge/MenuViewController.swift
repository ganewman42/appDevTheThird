//
//  MenuViewController.swift
//  FreshMerge
//
//  Created by Grace Newman on 4/4/16.
//  Copyright © 2016 Grace Newman. All rights reserved.
//

import UIKit

class MenuViewController: ViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var storedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
            
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Take photo
    //make image picker
    var imagePicker: UIImagePickerController!
    //make the popup
    //var popViewController = PopupViewController()
    

    //make the delegate method for the picker controller
    //dismisses the controller and sets the image into our view
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        //popViewController.showInView(self.view, withImage: image)
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        //myChecker.imageView.image = image
        storedImage = image
        performSegueWithIdentifier("menuToShow", sender: nil)
    }
    
    @IBAction func useCamera(sender: AnyObject) {
        
        //create a controller
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        //set to be the image picker
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    //MARK: Select photo from library
    
    @IBAction func chooseFromLibrary(sender: UIButton) {
        //make a controller
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        
        //set to be the image picker
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: Control the checking popup
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier=="menuToShow"){
            var detailVC = segue.destinationViewController as! PopupViewController;
            detailVC.toPass = storedImage!
        }
    }

}
