//
//  ImageViewController.swift
//  ViewControlerDemo
//
//  Created by Leo on 5/26/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scroll: UIScrollView!

    var imageView: UIImageView?
    var imageName: String?
    
    override func viewDidLoad() {
        
            super.viewDidLoad()

            self.imageView = UIImageView(image: UIImage(named: imageName!))
        
            self.scroll.addSubview(imageView!)
        
            self.scroll.contentSize = imageView!.frame.size
        
            self.scroll.delegate = self
        
            self.scroll.maximumZoomScale = 5.0
        
            self.scroll.minimumZoomScale = 1.0
        
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
