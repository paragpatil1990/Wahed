//
//  AttributedLable.swift
//  Wahed
//
//  Created by Amrit Singh on 2/15/17.
//  Copyright © 2017 InfoManav. All rights reserved.
//

import UIKit

@IBDesignable class AttributedLable: UILabel {
    
    @IBInspectable var fontSize: CGFloat = 13.0
    
    @IBInspectable var fontFamily: String = "Century Gothic"
    
    override func awakeFromNib() {
        let attrString = NSMutableAttributedString(attributedString: self.attributedText!)
        attrString.addAttribute(NSFontAttributeName, value: UIFont(name: self.fontFamily, size: self.fontSize)!, range: NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }
}

//class AttributedLable: UILabel {

       /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

//}
