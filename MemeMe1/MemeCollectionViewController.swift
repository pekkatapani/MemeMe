//
//  MemeCollectionViewController.swift
//  MemeMe1
//
//  Created by Pekka Kaariainen on 19/10/15.
//  Copyright © 2015 Pekka Kaariainen. All rights reserved.
//

import UIKit

class MemeCollectionViewController : UICollectionViewController {
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme] {
        
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad(){
        
        super.viewDidLoad()

        let space: CGFloat = 3.0
        let widthDimension = (self.view.frame.size.width - (2 * space)) / 3.0
        let heightDimension = (self.view.frame.size.height - (2 * space)) / 3.0
        
        collectionViewFlowLayout.minimumInteritemSpacing = space
        collectionViewFlowLayout.minimumLineSpacing = space
        collectionViewFlowLayout.itemSize = CGSizeMake(widthDimension, heightDimension)
    }
    
    //refresh data (otherwise the latest added meme will not be in the collection)
    override func viewWillAppear(animated: Bool) {
        self.collectionView!.reloadData();
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    //fill each item with a meme from array
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomMemeCell", forIndexPath: indexPath) as! CustomMemeCell
        let meme = memes[indexPath.item]
        cell.memeImage.image = meme.imageMemed
        return cell
    }
    
    @IBAction func addMeme(sender: AnyObject) {
        let memeViewController = self.storyboard!.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        navigationController!.presentViewController(memeViewController, animated: true, completion: nil)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        // Get the detailViewController from storyboard
        let object: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController")
        let memeDetailVC = object as! MemeDetailViewController
        
        //Setup the View Controller with selected meme
        memeDetailVC.selectedMeme = memes[indexPath.item]

        //Present the view controller
        self.navigationController!.pushViewController(memeDetailVC, animated: true)    
    }  
}
