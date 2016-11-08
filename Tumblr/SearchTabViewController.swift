//
//  SearchTabViewController.swift
//  Tumblr
//
//  Created by Narasimhan, Sindhuja on 11/7/16.
//  Copyright © 2016 Narasimhan, Sindhuja. All rights reserved.
//

import UIKit

class SearchTabViewController: UIViewController {
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var images: [UIImage]!
    
    var animatedImage: UIImage!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var loaderImageView: UIImageView!
   
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        images = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImage(with: images, duration: 1.0)

        loaderImageView.image = animatedImage
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0, delay: 2.0, options:[], animations: {
            self.loaderImageView.alpha = 0
            self.backgroundView.alpha = 0
            }, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        loaderImageView.alpha  = 1
        backgroundView.alpha = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
