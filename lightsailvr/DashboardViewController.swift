//
//  DashboardViewController.swift
//  lightsailvr
//
//  Created by Micah Chiang on 2/17/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentUser: [String:Dictionary<String, String>] = [:]
    var userName: String = ""
    var vidsAvailable: Dictionary<String, String> = [:]
    var vidTitles: Array<String> = []
    var vidDesc: Array<String> = []
    
    @IBOutlet weak var userNameTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //call setUser to assign values from currentUser to userName and vidsAvailable
        setUser()
        //assign userNameTextLabel to userName Variable value
        userNameTextLabel.text! = userName
    }

    //function for setting user information
    func setUser(){
        for(key, value) in currentUser {
            userName = key
            vidsAvailable = value
        }
        for (key, value) in vidsAvailable {
            vidTitles.append(key)
            vidDesc.append(value)
        }
        print(userName, vidsAvailable)
        print(vidTitles)
        print(vidDesc)
    }
    
    //table functions
    
    
    //returns number of rows needed
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vidTitles.count
    }
    
    //assigns video title and desc to each cell, then returns.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: VideoTableCell = tableView.dequeueReusableCellWithIdentifier("cell")! as! VideoTableCell
        cell.videoTitle.text! = vidTitles[indexPath.row] as String
        cell.videoDesc.text! = vidDesc[indexPath.row] as String
        return cell
    }
    

}
