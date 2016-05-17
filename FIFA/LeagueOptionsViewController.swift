//
//  LeagueOptionsViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

class LeagueOptionsViewController : UITableViewController{

    let numberOfOptions: [String] = ["Teams","LeagueTable (First:Top,Last:Bottom)"]
    let api: APIFile = APIFile()
    var leagueIndex: Int = 0
    var teamArray: [String]!
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func viewDidLoad() {
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "AppleSoccer")!
        imageView.image = image
        imageView.contentMode = .ScaleAspectFill
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = imageView
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfOptions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = numberOfOptions[indexPath.row]
        cell.textLabel!.font = UIFont(name:"CourierNewPS-BoldMT", size:17.5)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 0){ //clicked on teams
            let teamVC: TeamViewController = TeamViewController()
            teamVC.title = "Teams"
            teamVC.teamArray = teamArray
            teamVC.leagueIndex = leagueIndex
            navigationController?.pushViewController(teamVC, animated: true)
        }
        else if(indexPath.row == 1){ //chose to see league's leagueTable
            let newTeamArray: NSArray = try! api.getLeagueTable(leagueIndex)
            let LeagueTableVC: LeagueTableViewController = LeagueTableViewController()
            LeagueTableVC.teamArray = newTeamArray as! [String]
            LeagueTableVC.title = "League Table"
            LeagueTableVC.leagueIndex = leagueIndex
            navigationController?.pushViewController(LeagueTableVC, animated: true)
        }
    }
    
}