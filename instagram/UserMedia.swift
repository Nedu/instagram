//
//  Post.swift
//  instagram
//
//  Created by Chinedum Robert-Maduekwe on 3/5/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit
import Parse


class UserMedia: NSObject {
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        let media = PFObject(className: "UserMedia")
        media["media"] = getPFFileFromImage(image)
        media["author"] = PFUser.currentUser()
        media["caption"] = caption
        media["likesCount"] = 0
        media["commentsCount"] = 0
        media.saveInBackgroundWithBlock(completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }


}
