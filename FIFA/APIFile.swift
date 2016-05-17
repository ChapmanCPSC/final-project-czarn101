//
//  APIFile.swift
//  FIFA
//
//  Created by Albert Pierce on 5/5/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation
import UIKit

class APIFile {
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    func getLeagues() throws -> [String] {
        let jsonData: NSArray = try self.retrieveDataArray()
        var leagueNames = [String]()
        for j in 0...12 {
            leagueNames.append(jsonData[j]["caption"] as! String)
        }
        return leagueNames
    }
    
    func getTeams(leagueIndex: Int) throws -> [String] {
        let jsonData: NSArray = try self.retrieveDataArray()
        let teamsUrl: NSURL = NSURL(string: jsonData[leagueIndex]["_links"]!!["teams"]!!["href"] as! String)!
        
        var teamNames = [String]()
        
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: teamsUrl)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        let teamData: NSData =  try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let teamJsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(teamData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        let count: Int = teamJsonData["count"] as! Int
        
        for i in 0...(count-1) {
            teamNames.append(teamJsonData["teams"]![i]["name"] as! String)
            
        }
        
        return teamNames
    }
    
    func getCrest(leagueIndex: Int)throws -> [UIImage?] {
        let jsonData: NSArray = try self.retrieveDataArray()
        let teamsUrl: NSURL = NSURL(string: jsonData[leagueIndex]["_links"]!!["teams"]!!["href"] as! String)!
        
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: teamsUrl)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        let teamData: NSData =  try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        let teamJsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(teamData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        let count : Int = teamJsonData["count"] as! Int
        
        var crestArray = [UIImage?]()
        
        for i in 0...(count-1){
            let urlStr: NSString = teamJsonData["teams"]![i]["crestUrl"] as! String
            let url: NSString = urlStr.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            print(url)
            let crestUrl: NSURL = NSURL(string: url as String)!
            if let imageData: NSData = NSData(contentsOfURL: crestUrl)! {
                let crestImage: UIImage? = UIImage(data: imageData)
                crestArray.append(crestImage)
            }
        }
        
       return crestArray
        
    }
    
    func getFixture(leagueIndex: Int, teamIndex: Int) throws -> NSDictionary {
        let jsonData: NSArray = try self.retrieveDataArray()
        let teamsUrl: NSURL = NSURL(string: jsonData[leagueIndex]["_links"]!!["teams"]!!["href"] as! String)!
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: teamsUrl)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        let teamData: NSData =  try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        let teamJsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(teamData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        let fixtureUrl: NSURL = NSURL(string: teamJsonData["teams"]![teamIndex]["_links"]!!["fixtures"]!!["href"] as! String)!
        
        response = nil
        request = NSMutableURLRequest(URL: fixtureUrl)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        let fixtureData: NSData =  try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        let fixtureJsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(fixtureData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        return fixtureJsonData
        
        
        
        
    }
    
    
    func getPlayers(leagueIndex: Int, teamIndex: Int) throws -> NSArray {
        let jsonData: NSArray = try self.retrieveDataArray()
        
        let teamsUrl: NSURL = NSURL(string: jsonData[leagueIndex]["_links"]!!["teams"]!!["href"] as! String)!
        
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: teamsUrl)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        let teamData: NSData =  try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let teamJsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(teamData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        let playerUrl: NSURL = NSURL(string: teamJsonData["teams"]![teamIndex]["_links"]!!["players"]!!["href"] as! String)!
        
        response = nil
        request = NSMutableURLRequest(URL: playerUrl)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        let playerData: NSData =  try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let playerJsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(playerData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        return playerJsonData["players"] as! NSArray
    }
    
    func getLeagueTable(leagueIndex: Int)throws -> [String] {
        let jsonData: NSArray = try self.retrieveDataArray()
        
        let leagueTableUrl: NSURL = NSURL(string: jsonData[leagueIndex]["_links"]!!["leagueTable"]!!["href"] as! String)!
        
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: leagueTableUrl)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        let leagueTableData: NSData = try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let leagueTableJsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(leagueTableData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        var teamName = [String]()
        
        for i in 0...17{
            teamName.append(leagueTableJsonData["standing"]![i]["teamName"] as! String)
        }
        
        return teamName 
    }
    
    func getLeagueTableStats(leagueIndex: Int, teamIndex: Int)throws -> NSDictionary{
        let jsonData: NSArray = try self.retrieveDataArray()
        
        let leagueTableUrl: NSURL = NSURL(string: jsonData[leagueIndex]["_links"]!!["leagueTable"]!!["href"] as! String)!
        
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: leagueTableUrl)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        let leagueTableData: NSData = try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let leagueTableJsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(leagueTableData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        
        
        return (leagueTableJsonData["standing"]![teamIndex] as! NSDictionary)
       
    }
    
    
        
    
    func retrieveDataArray() throws -> NSArray {
        let url: NSURL = NSURL(string: "http://api.football-data.org/v1/soccerseasons")!
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.addValue("511096fd610d4cfe8a876d157ad58c1d", forHTTPHeaderField: "X-Auth-Token")
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        let dataVal: NSData =  try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        let jsonData: NSArray = try NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers) as! NSArray
        return jsonData
    }
    
}
    
