//
//  FlightHomeViewController.swift
//  VDOIT4U
//
//  Created by Guri Bambhrah on 17/06/16.
//  Copyright © 2016 VDoIt4U. All rights reserved.
//

import UIKit

class FlightHomeViewController: UIViewController {

    var resultString: String!
    var str : NSArray!
    var str_name_hotel = ""
    var str_check_in_hotel = ""
    var str_check_out_hotel = ""
    var str_contact_info_hotel = ""
    var str_address_hotel = ""
    @IBOutlet var act: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "custom_commmon_background.png")!)
        // Do any additional setup after loading the view.
        act.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goToAccommodation(_ sender: UIButton) {
        let acc = self.storyboard?.instantiateViewController(withIdentifier: "accom") as! AccomodationViewController
        act.becomeFirstResponder()
        act.isHidden = false
        act.startAnimating()
        
            DispatchQueue.main.async {
                // update some UI
                
                let request = NSMutableURLRequest(url: URL(string: "http://vdoit4u.com/accom.php")!)
                request.httpMethod = "POST"
                let postString = "username=\(SingletonClass.sharedInstance.username)"
                NSLog("%@", postString)
                request.httpBody = postString.data(using: String.Encoding.utf8)
                
                let task = URLSession.shared.dataTask(with: request, completionHandler: {
                    data, response, error in
                    
                    if error != nil {
                        print("error=\(error)")
                        
                        let alert = UIAlertController(title: "Error", message: "There was an error retrieving the data!!", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                        return
                    }
                    print("response = \(response)")
                    
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8)
                    print("responseString = \(responseString)")
                    self.resultString = responseString as! String
                    self.str = self.resultString.characters.split{$0 == ";"}.map(String.init)
                    self.str_name_hotel = self.str[0] as! NSString as String
                    self.str_check_in_hotel = self.str[1] as! NSString as String
                    self.str_check_out_hotel = self.str[2] as! NSString as String
                    self.str_contact_info_hotel = self.str[3] as! NSString as String
                    self.str_address_hotel = self.str[4] as! NSString as String
                    DispatchQueue.main.async(execute: {
                        // your navigation controller action goes here
                        acc.hotel_name = self.str_name_hotel
                        acc.hotel_check_in = self.str_check_in_hotel
                        acc.hotel_check_out = self.str_check_out_hotel
                        acc.hotel_contact_info = self.str_contact_info_hotel
                        acc.hotel_address = self.str_address_hotel
                        self.act.stopAnimating()
                        self.act.isHidden = true
                        self.act.resignFirstResponder()
                        self.navigationController?.pushViewController(acc, animated: true)
                    });
                    return
                }) 
                
                task.resume()
            }
        
        }
        
    override var prefersStatusBarHidden  : Bool {return true}
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
