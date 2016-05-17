//
//  TeamViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit


class TeamViewController: UITableViewController {
    
    let api: APIFile = APIFile()
    var leagueIndex: Int!
    var teamArray: [String]!
    var teamIndex: Int!
    var Images : [UIImage?]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TeamCrest", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "teamCrestCell")
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let newPlayerArray: NSArray = try! api.getPlayers(leagueIndex, teamIndex: indexPath.row)
        
        let teamOptionsVC: TeamOptionsViewController = TeamOptionsViewController()
        teamOptionsVC.playerArray = newPlayerArray
        teamOptionsVC.teamIndex = indexPath.row
        teamOptionsVC.title = teamArray[indexPath.row]
        teamOptionsVC.leagueIndex = leagueIndex
        navigationController?.pushViewController(teamOptionsVC, animated: true)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell: TeamCrestCell = self.tableView.dequeueReusableCellWithIdentifier("teamCrestCell") as! TeamCrestCell
        cell.teamNameLbl?.text = teamArray[indexPath.row]
        return cell
    }
}

