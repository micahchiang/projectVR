//
//  LoginViewController.swift
//  lightsailvr
//
//  Created by Micah Chiang on 2/17/16.
//  Copyright © 2016 Micah Chiang. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var ref: Firebase!
    var resultsDict: [String:Dictionary<String, String>] = [:]
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    @IBAction func SignInButtonTapped(sender: UIButton) {
        
        let username = userNameTextField.text!
        let password = passWordTextField.text!
        
        //check if fields are blank
        if username.isEmpty || password.isEmpty{
            displayErrorMessage("Fields cannot be blank")
        }
        else //if fields aren't blank, send information to firebase.
        {
            
            //update ref to contain username
            ref = Firebase(url:"https://vivid-torch-1588.firebaseio.com/"+username)
            ref.observeEventType(.Value, withBlock: {
                snapshot in
                print("\(snapshot.key) -> \(snapshot.value)")
                
                //add snapshot data to resultsDict as a dictionary with Keys that are strings, and values that are dictionaries with string keys and string values...lol.
                self.resultsDict[snapshot.key] = snapshot.value as? Dictionary
                //segue to dashboard view
                self.performSegueWithIdentifier("segueToDashboard", sender: self)
            })
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //create referece to Firebase
        ref = Firebase(url:"https://vivid-torch-1588.firebaseio.com/")
    }


   
    //prepare for segue functionality
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToDashboard" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! DashboardViewController
            controller.currentUser = resultsDict
            resultsDict = [:]
            userNameTextField.text! = ""
            passWordTextField.text! = ""
        }
    }
   
    
    //function for checking if field is empty
    func displayErrorMessage(errorMessage: String){
        let ac = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .Alert)
        let alert = UIAlertAction(title: "ok", style: .Default, handler: nil)
        ac.addAction(alert)
        self.presentViewController(ac, animated: true, completion: nil)
    }


}

