//
//  ColorBlockView.swift
//  IBDesignable - Part 1
//
//  Created by John Marstall on 6/16/15.
//  Copyright (c) 2015 Black Pixel. All rights reserved.
//

import UIKit

@IBDesignable class ColorBlockView: UIView {

    @IBInspectable var blockColor: UIColor = UIColor.gray {
        didSet {
            backgroundColor = blockColor
        }
    }
    
    @IBInspectable var cornerRounding: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRounding
        }
    }
    
    override func prepareForInterfaceBuilder() {
        backgroundColor = blockColor
        layer.cornerRadius = cornerRounding
    }
    
    override func awakeFromNib() {
        backgroundColor = blockColor
        layer.cornerRadius = cornerRounding
    }

}
