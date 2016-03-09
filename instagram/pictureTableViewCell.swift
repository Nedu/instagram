//
//  pictureTableViewCell.swift
//  instagram
//
//  Created by Chinedum Robert-Maduekwe on 3/5/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class pictureTableViewCell: UITableViewCell {   
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var pictureView: PFImageView!
        
    
    var upload: PFObject! {
        didSet {
            self.captionLabel.text = upload["caption"] as? String
            let picture = upload["picture"] as! PFObject
            self.pictureView.file = picture["image"] as? PFFile
            self.pictureView.loadInBackground()
        
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
