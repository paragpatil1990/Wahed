//
//  BaseViewController.swift
//  Wahed
//
//  Created by Amrit Singh on 2/9/17.
//  Copyright © 2017 InfoManav. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    func addRightBarButtonWith(title: String, target: AnyObject, selector: Selector)
    {
        let customBarItem : UIBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        self.navigationItem.rightBarButtonItem = customBarItem;
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    func addRightBarButtonWith(imagename: String, target: AnyObject, selector: Selector)
    {
        let btnShowMenu = UIButton(type: UIButtonType.system)
        btnShowMenu.setImage(UIImage(named: imagename), for: UIControlState())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(target, action: selector, for: UIControlEvents.touchUpInside)
            //#selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside);
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.rightBarButtonItem = customBarItem;
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }
    
    func navigationSetup()
    {
        // multiple attributes declared at once
        let multipleAttributes: [String : AnyObject] = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
        self.navigationController?.navigationBar.titleTextAttributes = multipleAttributes
        self.navigationController?.navigationBar.setBackgroundImage(createImageWithColor(W_ColorConstants.wNavigation_Color), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = createImageWithColor(W_ColorConstants.wNavigationShadow_Color)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    func createImageWithColor(_ color:UIColor) -> UIImage
    {
        let rect : CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size);
        let context : CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor);
        context.fill(rect);
        let theImage : UIImage  = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return theImage;
    }

    func btnMyAccount_Clcik(_ sender : UIButton)
    {
//        performSegue(withIdentifier: "myaccount", sender: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tcvc = storyboard.instantiateViewController(withIdentifier: "MyAccountViewController")
        navigationController?.pushViewController(tcvc, animated: true)
    }
    
    class func setRootViewContoller(withIdentifier: String)
    {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        guard let rootViewController = window.rootViewController else {
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: withIdentifier)
        vc.view.frame = rootViewController.view.frame
        vc.view.layoutIfNeeded()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            window.rootViewController = vc
        }, completion: { completed in
            // maybe do something here
        })
    }
    
    class func setInitialRootViewContoller()
    {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        guard let rootViewController = window.rootViewController else {
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        vc?.view.frame = rootViewController.view.frame
        vc?.view.layoutIfNeeded()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            window.rootViewController = vc
        }, completion: { completed in
            // maybe do something here
        })
        //        UIView.transition(from: appdelegate.window.rootViewController!.view, to: tabbar.view, duration: 0.6, options: [.transitionCrossDissolve], completion: {
        //            _ in
        //            appdelegate.window.rootViewController = tabbar
        //        })
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UILabel {
    

    var substituteFontName : String {
        get { return self.font.fontName }
        set {
           // print(self.font.fontName)

            if self.font.fontName.range(of: "Bold") == nil {
                self.font = UIFont(name: newValue, size: self.font.pointSize)
            }
        }
    }
    
    var substituteFontNameBold : String {
        get { return self.font.fontName }
        set {
            if self.font.fontName.range(of: "Bold") != nil {
                let f = UIFont(name: newValue, size: self.font.pointSize)
                self.font = f
            }
        }
    }
}
// MARK: - UTILITIES

/// set of view inpectables
extension UIView {
    /// border color inspectable prop.
    @IBInspectable public var borderColor: UIColor  {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    /// modify self.layer.borderWidth
    @IBInspectable public var borderWidth: CGFloat   {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    /// modify self.cornerRadius and set clipsTobounds to true
    @IBInspectable public var cornerRadius: CGFloat  {
        set {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
}
