//
//  TeamOptionsViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

class TeamOptionsViewController : UITableViewController {
    
    let numberOfOptions: [String] = ["Players","Fixtures"]
    let api: APIFile = APIFile()
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var playerArray : NSArray!
    var teamIndex: Int!
    var leagueIndex: Int!
    
    override func viewDidLoad() {
        
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "AppleSoccer")!
        imageView.image = image
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = imageView
        imageView.contentMode = .ScaleAspectFill
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfOptions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = numberOfOptions[indexPath.row]
        cell.textLabel!.font = UIFont(name:"CourierNewPS-BoldMT", size:20)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 0){ //see players
            let playerVC: PlayerViewController = PlayerViewController()
            playerVC.title = "Players"
            playerVC.playerArray = playerArray
            navigationController?.pushViewController(playerVC, animated: true)
        }
        else if(indexPath.row == 1){ //see fixtures
            let FixturesMatchDayVC : FixturesMatchDayViewController = FixturesMatchDayViewController()
            FixturesMatchDayVC.title = "Matches"
            FixturesMatchDayVC.teamIndex = teamIndex
            FixturesMatchDayVC.leagueIndex = leagueIndex
            FixturesMatchDayVC.FixtureTableInfoDict = try! api.getFixture(appDelegate.leagueIndex!, teamIndex: teamIndex)
            FixturesMatchDayVC.fixtureSize = FixturesMatchDayVC.FixtureTableInfoDict!["count"] as! Int
            navigationController?.pushViewController(FixturesMatchDayVC, animated: true)
        }
    }
}