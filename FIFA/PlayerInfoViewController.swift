//
//  PlayerInfoViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

class PlayerInfoViewController: UIViewController {
    @IBOutlet var nameLbl: UILabel?
    @IBOutlet var positionLbl: UILabel?
    @IBOutlet var jerseyLbl: UILabel?
    @IBOutlet var DOBLbl: UILabel?
    @IBOutlet var nationalityLbl: UILabel?
    @IBOutlet var contractLbl: UILabel?
    @IBOutlet var marketVaLbll: UILabel?
    var name: String?
    var position: String?
    var jersey: String?
    var DOB: String?
    var nationality: String?
    var contract: String?
    var marketVal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "AppleSoccer")!
        imageView.image = image
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        imageView.contentMode = .ScaleAspectFill
        
        nameLbl?.text = name
        positionLbl?.text = "Position: \(position!)"
        jerseyLbl?.text = "Jersey Number: \(jersey!)"
        DOBLbl?.text = "Date Of Birth: \(DOB!)"
        nationalityLbl?.text = "Nationality: \(nationality!)"
        contractLbl?.text = "Contract Expiration: \(contract!)"
        marketVaLbll?.text = "Market Value: \(marketVal!)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}