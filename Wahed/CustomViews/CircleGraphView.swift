//
//  CircleGraphView.swift
//  Wahed
//
//  Created by Amrit Singh on 2/14/17.
//  Copyright © 2017 InfoManav. All rights reserved.
//

import UIKit

class CircleGraphView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var endArc:CGFloat = 0.0{   // in range of 0.0 to 1.0
        didSet{
            setNeedsDisplay()
        }
    }
    var arcWidth:CGFloat = 10.0
    var arcColor = UIColor.yellow
    var arcBackgroundColor = UIColor.black
    
    override func draw(_ rect: CGRect) {
        
        //Important constants for circle
        let fullCircle = 2.0 * CGFloat(M_PI)
        let start:CGFloat = -0.25 * fullCircle
        let end:CGFloat = endArc * fullCircle + start
        
        let start1:CGFloat = -0.25 * fullCircle
        let end1:CGFloat = 1.0 * fullCircle + start
        
        //find the centerpoint of the rect
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        //define the radius by the smallest side of the view
        var radius:CGFloat = 0.0
        if rect.width > rect.height{
            radius = (rect.width - arcWidth) / 2.0
        }else{
            radius = (rect.height - arcWidth) / 2.0
        }
        
        //starting point for all drawing code is getting the context.
        let context = UIGraphicsGetCurrentContext()
        //set colorspace
//        let colorspace = CGColorSpaceCreateDeviceRGB()
        //set line attributes
        context!.setLineWidth(arcWidth * 0.8)
        context!.setLineCap(CGLineCap.round)
        //make the circle background
        
//        let angle = acos(rect.size.width / (2*radius));
//        let startAngle = CGFloat(M_PI)+angle // (180 degrees + angle)
//        let endAngle = CGFloat(M_PI*2)-angle // (360 degrees - angle)

        
        context!.setStrokeColor(arcBackgroundColor.cgColor)
        context?.addArc(center: centerPoint, radius: radius, startAngle: start1, endAngle: end1, clockwise: false)
//        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, 0, fullCircle, 0)
        context!.strokePath()
        
        //draw the arc
        context!.setStrokeColor(arcColor.cgColor)
        context!.setLineWidth(arcWidth * 0.8 )
        //CGContextSetLineWidth(context, arcWidth)
        context?.addArc(center: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: false)

//        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
        context!.strokePath()
        
    }

}
