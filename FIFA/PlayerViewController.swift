//
//  playerViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit


class PlayerViewController: UITableViewController {
    
    let api: APIFile = APIFile()
    var playerArray: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        return playerArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let playerVC: PlayerInfoViewController = storyBoard.instantiateViewControllerWithIdentifier("playerInfo") as! PlayerInfoViewController
        playerVC.name = playerArray[indexPath.row]["name"] as? String
        playerVC.position = playerArray[indexPath.row]["position"] as? String
        playerVC.jersey = String(playerArray[indexPath.row]["jerseyNumber"] as! Int)
        playerVC.DOB = playerArray[indexPath.row]["dateOfBirth"] as? String
        playerVC.contract = playerArray[indexPath.row]["contractUntil"] as? String
        playerVC.marketVal = playerArray[indexPath.row]["marketValue"] as? String
        playerVC.nationality = playerArray[indexPath.row]["nationality"] as? String
        playerVC.title = playerArray[indexPath.row]["name"] as? String
        navigationController?.pushViewController(playerVC, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let playerName: String = playerArray[indexPath.row]["name"] as! String
        cell.textLabel?.text = playerName
        cell.textLabel!.font = UIFont(name:"CourierNewPS-BoldMT", size:20)
        return cell
    }
}
