//
//  PopupViewController.swift
//  FreshMerge
//
//  Created by App-Dev Team on 4/4/16.
//  Copyright © 2016 App-Dev Team. All rights reserved.
//

import UIKit

class PopupViewController: ViewController {
    
    var imageView: UIImageView!
    var toPass: UIImage!
    
    @IBOutlet var photo: UIImageView!
    
    var mySticker = UIImage(named: "rsz_1logo")
    var overlayPhoto: UIImage {
        get{
            return overlayImage()
        }
    }
    
    
    
    @IBOutlet weak var labelText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photo.image = overlayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func overlayImage() -> UIImage {
        let newSize = photo.frame.size
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        
        toPass.drawInRect(CGRect(origin: CGPointZero, size: newSize))
        mySticker?.drawInRect(CGRect(origin: CGPointZero, size: CGSize(width: 225,height: 150)))
        
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
        
        
        
    }

    
    @IBAction func share(sender: AnyObject) {
        let vc = UIActivityViewController(activityItems: [overlayPhoto, "#picadino "], applicationActivities: nil)
        self.presentViewController(vc, animated: true, completion: nil)
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
