//
//  UploadViewController.swift
//  instagram
//
//  Created by Chinedum Robert-Maduekwe on 3/5/16.
//  Copyright © 2016 nedu. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var uploadImageView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choosePressed(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
    }

    @IBAction func cancelPressed(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func uploadPressed(sender: AnyObject) {
        Post.postUserImage(image, withCaption: captionField.text, withCompletion: nil)
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            image = info[UIImagePickerControllerOriginalImage] as! UIImage
            uploadImageView.image = image
            dismissViewControllerAnimated(true, completion: nil)
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
