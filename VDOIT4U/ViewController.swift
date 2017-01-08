//
//  ViewController.swift
//  VDOIT4U
//
//  Created by Guri Bambhrah on 13/06/16.
//  Copyright © 2016 VDoIt4U. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var username: UITextField!
    @IBOutlet var act: UIActivityIndicatorView!
    @IBOutlet var btn: UIButton!
    @IBOutlet var password: UITextField!
    @IBOutlet var rememberMe: CheckBox!
    
    
    var resultString: NSString = "Failure"
    override func viewDidLoad() {
        super.viewDidLoad()
        username.becomeFirstResponder()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "custom_commmon_background.png")!)
        act.isHidden = true
        let preferences = UserDefaults.standard
        let user_key = "username"
        let pass_key = "password"
        if (preferences.object(forKey: user_key) != nil && preferences.object(forKey: pass_key) != nil){
            username.text = preferences.object(forKey: user_key) as? String
            password.text = preferences.object(forKey: pass_key) as? String
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPress(_ sender: UIButton!) {
        if(rememberMe.isChecked)
        {
            let preferences = UserDefaults.standard
            let user_key = "username"
            let pass_key = "password"
            preferences.setValue(username.text, forKey: user_key)
            preferences.setValue(password.text, forKey: pass_key)
        }
        if(username.text != "" && password.text != "" ){
            sender.isEnabled = false
            act.isHidden = false
            act.startAnimating()
            
            let request = NSMutableURLRequest(url: URL(string: "http://vdoit4u.com/applogin.php")!)
            request.httpMethod = "POST"
            let postString = "username=\(self.username.text!)&password=\(self.password.text!)"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: {
                data, response, error in
                
                if error != nil {
                    print("error=\(error)")
                    
                    let alert = UIAlertController(title: "Error", message: "There was an error retrieving the data!!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.act.stopAnimating()
                    self.act.isHidden = true
                    sender.isEnabled = true
                    return
                }
                print("response = \(response)")
                
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8)
                print("responseString = \(responseString)")
                if (responseString == "success"){
                    print("Success Printed")
                    DispatchQueue.main.async(execute: {
                        // your navigation controller action goes here
                        let secondViewControllerObj = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
                        SingletonClass.sharedInstance.username = self.username.text
                        
                        self.act.stopAnimating()
                        self.act.isHidden = true
                        sender.isEnabled = true
                        self.navigationController?.pushViewController(secondViewControllerObj!, animated: true)
                    });
                    
                }
                else
                {
                    DispatchQueue.main.async(execute: {
                        // your navigation controller action goes here
                        let alert = UIAlertController(title: "Alert", message: "Please Enter the correct data!!", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        self.act.stopAnimating()
                        self.act.isHidden = true
                        self.btn.isEnabled = true
                    });
                    
                }
                return
            }) 
            
            task.resume()
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Required Fields Empty!!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.act.stopAnimating()
        self.act.isHidden = true
        btn.isEnabled = true
    }
    
    override var prefersStatusBarHidden  : Bool {return true}
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
}
