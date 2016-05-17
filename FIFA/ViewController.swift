//
//  ViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/5/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let api: APIFile = APIFile()
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var leagueArray: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "AppleSoccer")!
        imageView.image = image
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = imageView
        self.navigationController?.navigationBar.backgroundColor = UIColor.grayColor()
        leagueArray = try? api.getLeagues()
        for i in 0...(leagueArray.count-1) {
            leagueArray[i] = leagueArray[i].substringToIndex(leagueArray[i].endIndex.advancedBy(-8))
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel!.font = UIFont(name:"CourierNewPS-BoldMT", size:20)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let newTeamArray: [String] = try! api.getTeams(indexPath.row)
        let teamVC: TeamViewController = TeamViewController()
        let leagueOptionsVC: LeagueOptionsViewController = LeagueOptionsViewController()
        leagueOptionsVC.teamArray = newTeamArray
        appDelegate.leagueIndex = indexPath.row
        leagueOptionsVC.leagueIndex = indexPath.row
        leagueOptionsVC.title = leagueArray[indexPath.row]
        navigationController?.pushViewController(leagueOptionsVC, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = leagueArray[indexPath.row]
        
        return cell
    }
}

