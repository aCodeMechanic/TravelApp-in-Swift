//
//  SecondViewController.swift
//  VDOIT4U
//
//  Created by Guri Bambhrah on 13/06/16.
//  Copyright © 2016 VDoIt4U. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var username=""
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "custom_commmon_background.png")!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logoutPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Mesage", message: "Are you sure you want to log out?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Confirm..", style: UIAlertActionStyle.default, handler: { action in
            
            // do something like...
            self.navigationController?.popViewController(animated: true)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func navigateToNextView(_ sender: UIButton) {
        if sender.tag == 0
        {
            let fh = self.storyboard?.instantiateViewController(withIdentifier: "flight_home") as! FlightHomeViewController
            self.navigationController?.pushViewController(fh, animated: true)
        }
        if sender.tag == 1
        {
            let mv = self.storyboard?.instantiateViewController(withIdentifier: "must_visit") as! MustVisitViewController
            self.navigationController?.pushViewController(mv, animated: true)
        }
        if sender.tag == 2
        {
            let me = self.storyboard?.instantiateViewController(withIdentifier: "must_eat") as! MustEatViewController
            self.navigationController?.pushViewController(me, animated: true)
        }
        if sender.tag == 3
        {
            let ms = self.storyboard?.instantiateViewController(withIdentifier: "must_shop") as! MustShopViewController
            self.navigationController?.pushViewController(ms, animated: true)
        }
        if sender.tag == 4
        {
            let a = self.storyboard?.instantiateViewController(withIdentifier: "attendees") as! AttendeesViewController
            self.navigationController?.pushViewController(a, animated: true)
        }
        if sender.tag == 5
        {
            let ph = self.storyboard?.instantiateViewController(withIdentifier: "photos") as! PhotosViewController
            self.navigationController?.pushViewController(ph, animated: true)
        }
        
        if sender.tag == 6
        {
            let mv = self.storyboard?.instantiateViewController(withIdentifier: "messages") as! MessagesViewController
            self.navigationController?.pushViewController(mv, animated: true)
        }
        
        if sender.tag == 7
        {
            let dash = self.storyboard?.instantiateViewController(withIdentifier: "dash") as! DashViewController
            self.navigationController?.pushViewController(dash, animated: true)
        }
        
    }
    
    override var prefersStatusBarHidden  : Bool {return true}
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    

}
