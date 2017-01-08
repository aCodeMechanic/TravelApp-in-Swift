//
//  AttendeesViewController.swift
//  VDOIT4U
//
//  Created by Guri Bambhrah on 17/06/16.
//  Copyright © 2016 VDoIt4U. All rights reserved.
//

import UIKit

class AttendeesViewController:UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tablw: UITableView!
    @IBOutlet var lbl: UILabel!
    let arr = ["This","is" ,"a","Crazy","List"]
    var resultString: NSString!
    var username = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "custom_commmon_background.png")!)
        username = SingletonClass.sharedInstance.username as String
        let request = NSMutableURLRequest(url: URL(string: "http://www.vdoit4u.com/attendees.php")!)
        request.httpMethod = "POST"
        let postString = "username=Abdul"
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
            self.resultString = responseString!
            return
        }) 
        
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        // Configure the cell...
        
        cell.textLabel!.text = arr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    //code goes here
        tablw.deselectRow(at: indexPath, animated: true)
    }
    
    
}
