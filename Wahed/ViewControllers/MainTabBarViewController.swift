//
//  MainTabBarViewController.swift
//  Wahed
//
//  Created by Amrit Singh on 2/10/17.
//  Copyright © 2017 InfoManav. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.backgroundColor = .white
        self.tabBar.barTintColor = W_ColorConstants.wTabBar_Color
        self.tabBar.backgroundColor = W_ColorConstants.wTabBar_Color
        self.delegate = self
        
        // set tabbaritem text color and font
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: W_ColorConstants.wTabBarItem_Color], for:.normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for:.selected)
        
        //add gesture on TabBarController view to change tab
        setupSwipeGestureRecognizers(allowCyclingThoughTabs: false)
    }

    override func didReceiveMemoryWarning()
    {
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

extension MainTabBarViewController: UITabBarControllerDelegate
{

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
    {
        let tabViewControllers = tabBarController.viewControllers!
        guard let toIndex = tabViewControllers.index(of: viewController) else {
            return false
        }
        // Our method
        animateToTab(toIndex: toIndex)
        return true
    }

    func setupSwipeGestureRecognizers(allowCyclingThoughTabs cycleThroughTabs: Bool = false)
    {
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeLeftAllowingCyclingThroughTabs) : #selector(handleSwipeLeft))
        swipeLeftGestureRecognizer.direction = .left
        self.view.addGestureRecognizer(swipeLeftGestureRecognizer)
        
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeRightAllowingCyclingThroughTabs) : #selector(handleSwipeRight))
        swipeRightGestureRecognizer.direction = .right
        self.view.addGestureRecognizer(swipeRightGestureRecognizer)
    }
    
    func handleSwipeLeft(_ swipe: UISwipeGestureRecognizer)
    {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex + 1
        let toIndex = nextIndex < maxIndex ? nextIndex : maxIndex - 1
        animateToTab(toIndex: toIndex)
    }
    
    func handleSwipeRight(_ swipe: UISwipeGestureRecognizer)
    {
        let nextIndex = self.selectedIndex - 1
        let toIndex = nextIndex >= 0 ? nextIndex : 0
        animateToTab(toIndex: toIndex)
    }
    
    func handleSwipeLeftAllowingCyclingThroughTabs(_ swipe: UISwipeGestureRecognizer)
    {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex + 1
        let toIndex = nextIndex < maxIndex ? nextIndex : 0
        animateToTab(toIndex: toIndex)
        
    }
    
    func handleSwipeRightAllowingCyclingThroughTabs(_ swipe: UISwipeGestureRecognizer)
    {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex - 1
        let toIndex = nextIndex >= 0 ? nextIndex : maxIndex - 1
        animateToTab(toIndex: toIndex)
        
    }
    
    func animateToTab(toIndex: Int)
    {
        let tabViewControllers = viewControllers!
        let fromIndex = tabViewControllers.index(of: selectedViewController!)
        guard fromIndex != toIndex else {return}
        
        let fromView = selectedViewController!.view
        let toView = tabViewControllers[toIndex].view
        
        // Add the toView to the tab bar view
        fromView?.superview!.addSubview(toView!)
        
        // Position toView off screen (to the left/right of fromView)
        let screenWidth = UIScreen.main.bounds.size.width;
        let scrollRight = toIndex > fromIndex!;
        let offset = (scrollRight ? screenWidth : -screenWidth)
        toView?.center = CGPoint(x: (fromView?.center.x)! + offset, y: (toView?.center.y)!)
        
        // Disable interaction during animation
        view.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            // Slide the views by -offset
            fromView?.center = CGPoint(x: (fromView?.center.x)! - offset, y: (fromView?.center.y)!);
            toView?.center   = CGPoint(x: (toView?.center.x)! - offset, y: (toView?.center.y)!);
            
        }, completion: { finished in
            
            // Remove the old view from the tabbar view.
            fromView?.removeFromSuperview()
            self.selectedIndex = toIndex
            self.view.isUserInteractionEnabled = true
        })
    }

}

//extension UITabBarController
//{
//    func setupSwipeGestureRecognizers(allowCyclingThoughTabs cycleThroughTabs: Bool = false)
//    {
//        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeLeftAllowingCyclingThroughTabs) : #selector(handleSwipeLeft))
//        swipeLeftGestureRecognizer.direction = .left
//        self.view.addGestureRecognizer(swipeLeftGestureRecognizer)
//        
//        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeRightAllowingCyclingThroughTabs) : #selector(handleSwipeRight))
//        swipeRightGestureRecognizer.direction = .right
//        self.view.addGestureRecognizer(swipeRightGestureRecognizer)
//    }
//    
//    func handleSwipeLeft(_ swipe: UISwipeGestureRecognizer) {
//        self.selectedIndex -= 1
//    }
//    
//    func handleSwipeRight(_ swipe: UISwipeGestureRecognizer) {
//        self.selectedIndex += 1
//    }
//    
//     func handleSwipeLeftAllowingCyclingThroughTabs(_ swipe: UISwipeGestureRecognizer) {
//        let maxIndex = (self.viewControllers?.count ?? 0)
//        let nextIndex = self.selectedIndex - 1
//        self.selectedIndex = nextIndex >= 0 ? nextIndex : maxIndex - 1
//        
//    }
//    
//    func handleSwipeRightAllowingCyclingThroughTabs(_ swipe: UISwipeGestureRecognizer) {
//        let maxIndex = (self.viewControllers?.count ?? 0)
//        let nextIndex = self.selectedIndex + 1
//        self.selectedIndex = nextIndex < maxIndex ? nextIndex : 0
//    }
//}

