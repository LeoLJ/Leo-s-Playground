//
//  TableViewControllTableViewController.swift
//  FaceBookLike
//
//  Created by Leo on 6/4/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class tableViewController: UITableViewController, messageCellDelegate {
    
    var selfTextArray: [String] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 20
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.registerNib(UINib(nibName: "postViewCell", bundle: nil), forCellReuseIdentifier: "messageCell")
        self.tableView.registerNib(UINib(nibName: "messageTextViewCell", bundle: nil), forCellReuseIdentifier: "textFieldCell")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return selfTextArray.count+1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let userName = UserPhoto.userPhoto[indexPath.row]
        let userPhoto = Image.images[indexPath.row]
        let selfPhoto = UserPhoto.mySelfPhoto[0]
        
        switch indexPath.section {

        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("textFieldCell", forIndexPath: indexPath) as! messageTextViewCell
            
            cell.selfView.image = UIImage(named: selfPhoto.name)
            cell.delegate = self
            return cell
            
        case indexPath.section + 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as! postViewCell
            cell.timeLabel?.text = "realTime"
            cell.nameLabel?.text = userName.name
            cell.selfieImageView.image = UIImage(named: userName.name)
            cell.postImageView?.image = UIImage(named: userPhoto.name)
            cell.messageLabel?.text = userPhoto.description
            return cell
         
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as! postViewCell
            cell.timeLabel?.text = "\(NSDate())"
            cell.nameLabel?.text = "Myself"
            cell.selfieImageView.image = UIImage(named: selfPhoto.name)
            if cell.postImageView?.image == nil {
                cell.postImageView?.frame.size.height = 0
            }
            cell.messageLabel.text = selfTextArray[selfTextArray.count-indexPath.section]
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var title: String?
//        switch section {
//        case 0:
//            title = nil
//        case 1:
//            title = " "
//        default:
//            break
//        }
        return " "
    }
    
    func sendMessage(message: String?) {
        selfTextArray.append((message)!)
        self.tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
