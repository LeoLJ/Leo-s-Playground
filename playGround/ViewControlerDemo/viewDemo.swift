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
    var timer: NSTimer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var stepperView: UIStepper!
    @IBOutlet weak var bigView: UIImageView!

    
    
    @IBAction func sliderChanged(sender: AnyObject) {
        let slider = sender as! UISlider
        self.imageView.alpha = CGFloat(slider.value/1000)
        self.label.text = String(format: "alpha: %.02f", slider.value/1000)
        stepperView.value = Double(slider.value)
        
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func stepperChanged(sender: AnyObject) {
        let stepper = sender as! UIStepper
        self.imageView.alpha = CGFloat(stepper.value/1000)
        self.label.text = String(format: "alpha: %.02f", stepper.value/1000)
        sliderView.value = Float(stepper.value)
    }    

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
    
    func simulateLoading(){
        if self.progressView.progress == 1.0 {
            self.progressView.hidden = true
            self.imageView .image =  UIImage (named: timer.userInfo as! String)
            self.bigView.image =  UIImage (named: timer.userInfo as! String)
            timer.invalidate()
        } else {
            progressView.progress += 0.1
        }
    }
    
    
    func setImage(name: String){
  //      self.imageView.image = UIImage(named: name)
        self.progressView.hidden = false
        self.progressView.progress = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewDemo.simulateLoading), userInfo: name, repeats: true)
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
