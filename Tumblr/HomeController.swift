//
//  HomeController.swift
//  Tumblr
//
//  Created by Narasimhan, Sindhuja on 11/7/16.
//  Copyright © 2016 Narasimhan, Sindhuja. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    @IBOutlet weak var scrollingContent: UIScrollView!

    var selectedButtonBg: [UIImage] = [UIImage(named:"home_selected_icon.png")!,UIImage(named:"search_selected_icon")!,UIImage(named:"account_selected_icon")!,UIImage(named:"trending_selected_icon")!,UIImage(named:"compose_button")!]
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    var fadeTransition: FadeTransition!

    
    @IBOutlet weak var explorePop: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons[0] = homeButton
        buttons[1] = searchButton
        buttons[2] = contactButton
        buttons[3] = trendingButton

        scrollingContent.contentSize = contentView.frame.size

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeTab")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchTab")
        accountViewController = storyboard.instantiateViewController(withIdentifier: "ContactsTab")
        trendingViewController = storyboard.instantiateViewController(withIdentifier: "TrendingsTab")
        

        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        UIView.animate(withDuration:0.8, delay: 0.0,
                       // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
            options: [.autoreverse,.repeat], animations: { () -> Void in
                self.explorePop.transform = CGAffineTransform(translationX: 0, y: 8)
            }, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let vc = viewControllers[selectedIndex]
        vc.didMove(toParentViewController: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressTab(_ sender: AnyObject) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        if(selectedIndex == 1) {
            UIView.animate(withDuration:0.4, delay: 0.0,
                           options: [],
                           animations: { () -> Void in
                            self.explorePop.alpha = 0
                }, completion: nil)
        }
        print(previousIndex)
        print(selectedIndex)

        
        buttons[previousIndex].isSelected = false
        buttons[selectedIndex].isSelected = true
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        let vc = viewControllers[selectedIndex]
        if(buttons[selectedIndex].isSelected == true) {
            buttons[selectedIndex].setBackgroundImage(selectedButtonBg[selectedIndex], for: .selected)
        }

        addChildViewController(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)

    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
     }
    

}
