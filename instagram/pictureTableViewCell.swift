//
//  pictureTableViewCell.swift
//  instagram
//
//  Created by Chinedum Robert-Maduekwe on 3/5/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit
import Parse


class pictureTableViewCell: UITableViewCell {   
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    
    var picture: PFObject! {
        didSet {
            captionLabel.text = picture.objectForKey("caption") as? String
            let img = picture.objectForKey("post") as? PFFile
            img!.getDataInBackgroundWithBlock( {
                (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    let image = UIImage(data: imageData!)
                    self.pictureView.image = image
                }
            })
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
