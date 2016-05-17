//
//  TeamFixturesViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

class LeagueTableViewController : UITableViewController {
    
    var teamArray: [String]!
    var teamIndex: Int!
    var leagueIndex: Int!
    let api: APIFile = APIFile()
    
    override func viewDidLoad() {
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "AppleSoccer")!
        imageView.image = image
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
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = teamArray[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let leagueTableInfoVC: LeagueTableInfoViewController = storyBoard.instantiateViewControllerWithIdentifier("leagueTableInfo") as! LeagueTableInfoViewController
        let teamIndex = indexPath.row
        
        let leagueTableInfoDict: NSDictionary = try! api.getLeagueTableStats(leagueIndex, teamIndex: teamIndex)
        leagueTableInfoVC.teamName = leagueTableInfoDict["teamName"] as? String
        leagueTableInfoVC.title = leagueTableInfoDict["teamName"] as? String
        leagueTableInfoVC.playedGames = leagueTableInfoDict["points"] as! Int
        leagueTableInfoVC.goals = leagueTableInfoDict["goals"] as! Int
        leagueTableInfoVC.points = leagueTableInfoDict["points"] as! Int
        leagueTableInfoVC.goalsAgainst = leagueTableInfoDict["goalsAgainst"] as! Int
        leagueTableInfoVC.goalDifference = leagueTableInfoDict["goalDifference"] as! Int
        leagueTableInfoVC.wins = leagueTableInfoDict["wins"] as! Int
        leagueTableInfoVC.draws = leagueTableInfoDict["draws"] as! Int
        leagueTableInfoVC.losses = leagueTableInfoDict["losses"] as! Int
        navigationController?.pushViewController(leagueTableInfoVC, animated: true)
    }
}