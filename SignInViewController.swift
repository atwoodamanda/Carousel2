//
//  SignInViewController.swift
//  Carousel
//
//  Created by Amanda Atwood on 10/18/14.
//  Copyright (c) 2014 Amanda Atwood. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInView: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var signInViewCenterY: CGFloat!
    var signInButtonCenterY: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        signInViewCenterY = signInView.center.y
        signInButtonCenterY = signInButton.center.y
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        self.signInView.center.y = self.signInViewCenterY - 200
        self.signInButton.center.y = self.signInButtonCenterY - 200
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        self.signInView.center.y = self.signInViewCenterY + 200
        self.signInButton.center.y = self.signInButtonCenterY + 200
        
    }
    
    @IBAction func onSignInButton(sender: AnyObject) {
        signInButton.selected = true
        activityView.startAnimating()
        
        
        if self.emailField.text.isEmpty || self.passwordField.text.isEmpty {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        
        delay(2) {self.activityView.stopAnimating()
            self.signInButton.selected = false
         if self.emailField.text == "amanda@hearsay.com" && self.passwordField.text == "pass" {self.performSegueWithIdentifier("app_segue", sender: self)
            }
            
        
        
        else {
            var alertView2 = UIAlertView(title: "Sign-in Failed", message: "Incorrect email of password", delegate: nil, cancelButtonTitle: "OK")
            alertView2.show()
        }
        }
        }
    
    
        
    
    
    @IBAction func onBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


