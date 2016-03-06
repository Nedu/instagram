//
//  InstagramViewController.swift
//  instagram
//
//  Created by Chinedum Robert-Maduekwe on 3/5/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit
import Parse

class InstagramViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    @IBOutlet weak var tableView: UITableView!
    
     var upload: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .None

    }
    
    override func viewWillAppear(animated: Bool) {
        let currentUser = PFUser.currentUser()
        let query = PFQuery(className: "Post")
        query.whereKey("user", equalTo: currentUser!)
        query.orderByDescending("createdAt")
        query.includeKey("picture")
        query.limit = 20
        query.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error: NSError?) -> Void in
            if let error = error {
                print("Error: \(error)")
            } else {
                if let results = results {
                    
                    self.upload = results
                    
                    print("Successfully retrieved \(results.count) posts")
                    self.tableView.reloadData()
                    self.tableView.separatorStyle = .None
                } else {
                    print("No results returned")
            }
        }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeCell", forIndexPath: indexPath) as! pictureTableViewCell
        
        cell.upload = upload[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.upload != nil {
                return (self.upload?.count)!
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
        }
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
