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
    
     var pictures: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("picture")
        query.limit = 20
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                self.pictures = posts
                self.tableView.reloadData()
            } else {
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pictureCell", forIndexPath: indexPath) as! pictureTableViewCell
        
        cell.picture = pictures[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if pictures != nil {
            if pictures.count < 20 {
                return pictures.count
            } else {
                return 20
            }
        } else {
            return 0
        }
    }
    
    @IBAction func uploadPressed(sender: AnyObject) {
        
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("picture")
        query.limit = 20
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                self.pictures = posts
                self.tableView.reloadData()
            } else {
                // handle error
            }
        }
    
    }

    @IBAction func logoutClicked(sender: AnyObject) {
        
        PFUser.logOut()
        NSNotificationCenter.defaultCenter().postNotificationName("UserDidLogout", object: nil)
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
