//
//  AccomodationViewController.swift
//  VDOIT4U
//
//  Created by Guri Bambhrah on 21/06/16.
//  Copyright © 2016 VDoIt4U. All rights reserved.
//

import UIKit

class AccomodationViewController: UIViewController {

    var resultString: String!
    var str : NSArray!
    @IBOutlet var hotelName: UILabel!
    @IBOutlet var hotelCheckIn: UILabel!
    @IBOutlet var hotelCheckOut: UILabel!
    @IBOutlet var hotelContactInfo: UILabel!
    @IBOutlet var hotelAddress: UITextView!
    
    @IBOutlet var act: UIActivityIndicatorView!
    var hotel_name = "Sample"
    var hotel_check_in = "Sample"
    var hotel_check_out = "Sample"
    var hotel_contact_info = "Sample"
    var hotel_address = "Sample"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "custom_commmon_background.png")!)
       // self.doBackgroundTask()
        edgesForExtendedLayout = .all
        hotelName.text = hotel_name
        hotelCheckIn.text = hotel_check_in
        hotelCheckOut.text = hotel_check_out
        hotelContactInfo.text = hotel_contact_info
        hotelAddress.text = hotel_address
        // Do any additional setup after loading the view.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden  : Bool {return true}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
