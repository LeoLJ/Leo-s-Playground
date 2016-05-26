//
//  ImageViewController.swift
//  ViewControlerDemo
//
//  Created by Leo on 5/26/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    

    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        
            super.viewDidLoad()

            self.imageView = UIImageView(image:UIImage(named: "jump"))
        
            self.scrollView.addSubview(imageView!)
        
            self.scrollView.contentSize = imageView!.frame.size
        
            self.scrollView.delegate = self
        
            self.scrollView.maximumZoomScale = 5.0
        
            self.scrollView.minimumZoomScale = 1.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
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
