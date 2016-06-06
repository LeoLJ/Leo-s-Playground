//
//  imageTableViewController.swift
//  ViewControlerDemo
//
//  Created by Leo on 6/1/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class imageTableViewController: UITableViewController, ClickableCellDelegate {
    
   
    @IBAction func firstTab(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 0            
    }
    
    @IBAction func editTableView(sender: AnyObject) {
        self.tableView.setEditing(!self.tableView.editing, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 10
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.registerNib(UINib(nibName: "MyImageTableViewCell", bundle: nil), forCellReuseIdentifier: "MyImageCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows: Int!
        switch section{
            case 0:
                numberOfRows = 1
            default:
                numberOfRows = Image.images.count //usually using switch
        }
        return numberOfRows
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let imageName = Image.images[indexPath.row]

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("ClickButtonCell", forIndexPath: indexPath) as! ClickableCell
                cell.delegate = self
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("imageCell", forIndexPath: indexPath)
               cell.textLabel?.text = imageName.name
               cell.imageView?.image = UIImage(named: imageName.name)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("MyImageCell", forIndexPath: indexPath) as! MyImageTableViewCell
            
               cell.nameLabel.text = imageName.name
               cell.viewInCell.image = UIImage(named: imageName.name)
               cell.descriptionLabel.text = imageName.description
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String?
        switch section {
        case 0:
            title = "Click Buttton"
        case 1:
            title = "Cell from Xcode"
        case 2:
            title = "Cell from Custom"
        default:
            break
        }
        return title
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section != 0{
        self.performSegueWithIdentifier("largeView", sender: Image.images[indexPath.row])
        }
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            Image.images.removeAtIndex(indexPath.row) // if you dont remove it, your array and indexPath wont compare
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }    
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let imageName = Image.images.removeAtIndex(fromIndexPath.row)
        //Image.imageNames.removeAtIndex(fromIndexPath.row)
        Image.images.insert(imageName, atIndex: toIndexPath.row)

    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "largeView" {
            let destinationViewController = segue.destinationViewController as! ImageViewController
            let imageName = sender as! Image
            destinationViewController.imageName = imageName.name
            
        }
    }
    
    func sayBye() {
        self.tabBarController?.selectedIndex = 0
    }
    
}
