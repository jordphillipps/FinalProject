/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse
import CoreData


class ViewController: UIViewController {
    
    
    var signupActive = true
    
    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var signupButton: UIButton!
    
    @IBOutlet var registeredText: UILabel!
    
    @IBOutlet var loginButton: UIButton!
    
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction((UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func signUp(sender: AnyObject) {
    
        //Error message for when the user hasn't entered username and password credentials.
        if username.text == "" || password.text == "" {
            
          
            displayAlert("Error in form", message: "Please enter a username and password")
            
        }else {
            
            //Begin activity indicator to sign up the user
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            
            var errorMessage = "Please try again later"
            
            if signupActive == true {
            
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            
            
            
            user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil {
                    //signup succesful 
                    
                    self.performSegueWithIdentifier("login", sender: self)
                    
                    
                } else {
                    
                    if let errorString = error!.userInfo["error"] as? String {
                        
                        errorMessage = errorString
                        
                    }
                    
                    self.displayAlert("Failed to sign up", message: errorMessage)
                    
                    
                }
                
                
            })
            
            
            }else {
                
                PFUser.logInWithUsernameInBackground(username.text!, password: password.text!, block: { (user, error) -> Void in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    if user != nil {
                        
                        //logged in!
                        dispatch_async(dispatch_get_main_queue()) {
                            [unowned self] in
                            self.performSegueWithIdentifier("login", sender: self)
                        }
                        
                        
                    }else {
                        
                        if let errorString = error!.userInfo["error"] as? String {
                            
                            errorMessage = errorString
                        }
                        
                        self.displayAlert("Failed to login", message: errorMessage)
                        
                    }
                    
                })
            }
            
        }
       
        
    }

    
    
    @IBAction func logIn(sender: AnyObject) {
        
        if signupActive == true {
            
            signupButton.setTitle("Login", forState: UIControlState.Normal)
            
            registeredText.text = "Not Registered?"
            
            loginButton.setTitle("Sign Up", forState: UIControlState.Normal)
            
            signupActive = false
            
        }else {
            
            signupButton.setTitle("Sign Up", forState: UIControlState.Normal)
            
            registeredText.text = "Already Registered?"
            
            loginButton.setTitle("Login", forState: UIControlState.Normal)
            
            signupActive = true
            
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Username Image in textfield username
        var imageView = UIImageView();
        
        var image = UIImage(named: "Contacts Filled-50.png");
        
        imageView.image = image;
        
        username.leftView = imageView;
        
        username.leftViewMode = UITextFieldViewMode.Always
        
        imageView.alpha = 0.1
        
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.addSubview(imageView)
        
        
        
        //Password image in textfield password
        var imageViewTwo = UIImageView();
        
        var imageTwo = UIImage(named: "Lock Filled-50.png");
        
        imageViewTwo.image = imageTwo;
        
        password.leftView = imageViewTwo;
        
        password.leftViewMode = UITextFieldViewMode.Always
        
        imageViewTwo.alpha = 0.1
        
        imageViewTwo.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.addSubview(imageViewTwo)
        
        
        
        }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



