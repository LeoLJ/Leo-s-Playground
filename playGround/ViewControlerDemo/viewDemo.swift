//
//  ViewDemo.swift
//  ViewControlerDemo
//
//  Created by Leo on 5/24/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class ViewDemo: UIViewController {

    let photo = ["stand","jump"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label: UILabel!
    @IBAction func changePhoto(sender: AnyObject) {
        let alert = UIAlertController(title: "Change Image", message: "please select a photo", preferredStyle: .ActionSheet)
        for name: String in photo {
            let action = UIAlertAction(title: name, style: .Default, handler: { (UIAlertAction) in
                self.setImage(name)
            })
                alert.addAction(action)
        }
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setImage(name: String){
        self.imageView.image = UIImage(named: name)
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
