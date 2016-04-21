//
//  MemeDetailViewController.swift
//  MemeMe1
//
//  Created by Pekka Kaariainen on 20/10/15.
//  Copyright © 2015 Pekka Kaariainen. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    var selectedMeme: Meme!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        self.memeImageView!.image = selectedMeme.imageMemed
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {    
				if (segue.identifier == "editMemeSegue") {
						if let editorVC = segue.destinationViewController as? ViewController {  
								editorVC.image = selectedMeme.image
                editorVC.topString = selectedMeme.topText
                editorVC.bottomString = selectedMeme.bottomText
                editorVC.startedFromSeque = true
            } 
        }
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        print("dismissViewControllerAnimated")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}