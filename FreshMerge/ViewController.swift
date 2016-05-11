//
//  ViewController.swift
//  FreshMerge
//
//  Created by Grace Newman on 4/4/16.
//  Copyright © 2016 Grace Newman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        exo()
    
    }

        //exo()
        
        // Do any additional setup after loading the view, typically from a nib.
        
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    private func exo() {
        let filePath = NSBundle.mainBundle().pathForResource("dino", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        let webViewBG = UIWebView(frame: self.view.frame)
        webViewBG.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL : NSURL())
        webViewBG.tag=100
        webViewBG.userInteractionEnabled = false
        self.view.addSubview(webViewBG)
        self.view.sendSubviewToBack(webViewBG)
        
    }

}

