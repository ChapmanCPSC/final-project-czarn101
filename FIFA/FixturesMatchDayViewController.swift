//
//  FixturesMatchDayViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/11/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

class FixturesMatchDayViewController : UITableViewController {
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let api: APIFile = APIFile()
    var teamIndex: Int!
    var leagueIndex: Int!
    var fixtureSize: Int!
    var FixtureTableInfoDict: NSDictionary?

    override func viewDidLoad() {
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "FixtureCell")
        
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "AppleSoccer")!
        imageView.image = image
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = imageView
        imageView.contentMode = .ScaleAspectFill
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixtureSize
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = self.tableView.dequeueReusableCellWithIdentifier("FixtureCell") as! TableViewCell
        cell.HomeTeamLbl.text = FixtureTableInfoDict!["fixtures"]![indexPath.row]!["homeTeamName"] as? String
        cell.AwayTeamLbl.text = FixtureTableInfoDict!["fixtures"]![indexPath.row]!["awayTeamName"] as? String
        
        if FixtureTableInfoDict!["fixtures"]![indexPath.row]!["result"]!!["goalsHomeTeam"] is NSNull {
            cell.homeScoreLbl.text = "0"
        }
        else{
            cell.homeScoreLbl.text = String(FixtureTableInfoDict!["fixtures"]![indexPath.row]!["result"]!!["goalsHomeTeam"] as! Int)
        }
    
        if FixtureTableInfoDict!["fixtures"]![indexPath.row]!["result"]!!["goalsAwayTeam"] is NSNull {
            cell.awayScoreLbl.text = "0"
        }
        else{
            cell.awayScoreLbl.text =  String(FixtureTableInfoDict!["fixtures"]![indexPath.row]!["result"]!!["goalsAwayTeam"] as! Int)
        }
        
        if (FixtureTableInfoDict!["fixtures"]![indexPath.row]!["result"]!!["goalsHomeTeam"] as! Int) > (FixtureTableInfoDict!["fixtures"]![indexPath.row]!["result"]!!["goalsAwayTeam"] as! Int){
            cell.homeScoreLbl.backgroundColor = UIColor.blueColor()
            cell.awayScoreLbl.backgroundColor = UIColor.redColor()
        }
        else if (FixtureTableInfoDict!["fixtures"]![indexPath.row]!["result"]!!["goalsHomeTeam"] as! Int) == (FixtureTableInfoDict!["fixtures"]![indexPath.row]!["result"]!!["goalsAwayTeam"] as! Int){
            cell.homeScoreLbl.backgroundColor = UIColor.clearColor()
            cell.awayScoreLbl.backgroundColor = UIColor.clearColor()
        }
        else{
            cell.homeScoreLbl.backgroundColor = UIColor.redColor()
            cell.awayScoreLbl.backgroundColor = UIColor.blueColor()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
    }
    
    
    
    
}