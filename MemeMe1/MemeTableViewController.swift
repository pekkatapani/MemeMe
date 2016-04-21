//
//  MemeTableViewController.swift
//  MemeMe1
//
//  Created by Pekka Kaariainen on 20/10/15.
//  Copyright © 2015 Pekka Kaariainen. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()        
    }

    @IBAction func addMeme(sender: AnyObject) {
        let editingVievController = self.storyboard!.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        navigationController!.presentViewController(editingVievController, animated: true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {         return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomMemeCell", forIndexPath: indexPath)
        let meme = memes[indexPath.item]
        cell.imageView!.image = meme.imageMemed
        cell.textLabel?.text = meme.topText + "..." + meme.bottomText
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) { 
        let memeDetailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        memeDetailViewController.selectedMeme = memes[indexPath.item]
        
        navigationController!.pushViewController(memeDetailViewController, animated: true)
    }   
}