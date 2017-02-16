//
//  Constant.swift
//  Wahed
//
//  Created by Amrit Singh on 2/10/17.
//  Copyright © 2017 InfoManav. All rights reserved.
//

import Foundation

struct W_URlConstants
{
}

struct W_FontConstants
{
    static let wFont_Regular: String = ""
}

struct W_ScreenSizeConstants
{
    //  Device IPHONE
    static let wIphone_4s : Bool =  (UIScreen.main.bounds.size.height == 480)
    static let wIphone_5 : Bool =  (UIScreen.main.bounds.size.height == 568)
    static let wIphone_6 : Bool =  (UIScreen.main.bounds.size.height == 667)
    static let wIphone_6_Plus : Bool =  (UIScreen.main.bounds.size.height == 736)
}

struct W_ColorConstants
{
    // Custom Colors
    static let wNavigation_Color: UIColor = UIColor(red: 12.0/255.0, green: 32.0/255.0, blue: 67.0/255.0, alpha: 1.0)
    static let wNavigationShadow_Color: UIColor = .black
    static let wTabBar_Color: UIColor = UIColor(red: 14.0/255.0, green: 37.0/255.0, blue: 71.0/255.0, alpha: 1.0)
    static let wTabBarItem_Color: UIColor = UIColor(red: 84.0/255.0, green: 117.0/255.0, blue: 162.0/255.0, alpha: 1.0)
}
