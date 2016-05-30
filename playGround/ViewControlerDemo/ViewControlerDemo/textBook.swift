//
//  textBook.swift
//  ViewControlerDemo
//
//  Created by Leo on 5/24/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class textBook: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.LabelView.text = "hello, hi, everyone, apperentyl, sort of ... sounds good and also yeah "
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var LabelView: UILabel!


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
