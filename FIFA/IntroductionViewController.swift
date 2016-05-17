//
//  IntroductionViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/15/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

class IntroductionViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "Nike")!
        imageView.image = image
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        imageView.contentMode = .ScaleAspectFill
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}