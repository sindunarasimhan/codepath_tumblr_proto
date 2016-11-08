//
//  ComposeOptionsController.swift
//  Tumblr
//
//  Created by Narasimhan, Sindhuja on 11/7/16.
//  Copyright © 2016 Narasimhan, Sindhuja. All rights reserved.
//

import UIKit

class ComposeOptionsController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    var fadeTransition: FadeTransition!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var number = 0
        while(number<=5) {
            UIView.animate(withDuration:0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options:[] ,
                           animations: { () -> Void in
                            self.buttons[number].alpha = 1
                            self.buttons[number].center.y = self.buttons[number].center.y - 10
                            number = number+1;
                }, completion: nil)
        }
        
    }
    
        
    @IBOutlet weak var onNevermindClicked: UIButton!

    @IBAction func didNeverMindClicked(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)

    }
    
    

}
