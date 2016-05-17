//
//  LeagueTableInfoViewController.swift
//  FIFA
//
//  Created by Albert Pierce on 5/10/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

class LeagueTableInfoViewController : UIViewController{
    
    @IBOutlet var teamNameLbl: UILabel?
    @IBOutlet var playedGamesLbl: UILabel!
    @IBOutlet var pointsLbl: UILabel!
    @IBOutlet var goalsLbl: UILabel!
    @IBOutlet var goalsAgainstLbl: UILabel!
    @IBOutlet var goalDiffLbl: UILabel!
    @IBOutlet var winsLbl: UILabel!
    @IBOutlet var drawsLbl: UILabel!
    @IBOutlet var lossesLbl: UILabel!
    var teamName: String?
    var playedGames: Int?
    var points: Int?
    var goals: Int?
    var goalsAgainst: Int?
    var goalDifference: Int?
    var wins: Int?
    var draws: Int?
    var losses: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "AppleSoccer")!
        imageView.image = image
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        imageView.contentMode = .ScaleAspectFill
        
        teamNameLbl?.text = teamName
        playedGamesLbl!.text = "PlayedGames: \(String(playedGames!))"
        pointsLbl!.text = "Points: \(String(points!))"
        goalsLbl?.text = "Goals: \(String(goals!))"
        goalsAgainstLbl?.text = "GoalsAgainst: \(String(goalsAgainst!))"
        goalDiffLbl?.text = "GoalDifference: \(String(goalDifference!))"
        winsLbl?.text = "Wins: \(String(wins!))"
        drawsLbl?.text = "Draws: \(String(draws!))"
        lossesLbl?.text = "Losses: \(String(losses!))"
    }
}