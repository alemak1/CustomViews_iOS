//
//  TargetView.swift
//  ImageRiddle
//
//  Created by Aleksander Makedonski on 2/12/17.
//  Copyright © 2017 Builtlight. All rights reserved.
//

import UIKit

let CROSSHAIRS_CIRCLE_SIZE: CGFloat = 20.0
let CROSSHAIRS_SIZE: CGFloat = 30.0
let CROSSHAIRS_CIRCLE_INSET = (CROSSHAIRS_SIZE - CROSSHAIRS_CIRCLE_SIZE)/2

class TargetView: UIView {
    
    private var  crosshairsLayer: CAShapeLayer
    
    override init(frame: CGRect) {
        self.crosshairsLayer = CAShapeLayer()
        super.init(frame: frame)
        
        //set transpartent so that we still see the image
        self.backgroundColor = UIColor.clear

        //CAShapeLayer properties are set here, drawing must be done in drawRect()
        self.crosshairsLayer.bounds = CGRect(x: 0, y: 0, width: CROSSHAIRS_SIZE, height: CROSSHAIRS_SIZE)
        self.crosshairsLayer.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        
        //self.crosshairsLayer.backgroundColor = UIColor.red.cgColor //testing
        self.crosshairsLayer.strokeColor = UIColor.black.cgColor //crosshairs drawing color
        self.crosshairsLayer.fillColor = UIColor.clear.cgColor //we only want an outline
        
        self.layer.addSublayer(self.crosshairsLayer)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let crosshairPos = touch.location(in: self)
            print("touch position: \(crosshairPos.x), \(crosshairPos.y)")
            
            self.crosshairsLayer.position = crosshairPos
            
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        //circle part of crosshairs
        
        let circlePathBox = CGRect(x: CROSSHAIRS_CIRCLE_INSET/2, y: CROSSHAIRS_CIRCLE_INSET/2, width: self.crosshairsLayer.bounds.width - CROSSHAIRS_CIRCLE_INSET, height: self.crosshairsLayer.bounds.height - CROSSHAIRS_CIRCLE_INSET)
        
        let circlePath = UIBezierPath(ovalIn: circlePathBox)
        self.crosshairsLayer.path = circlePath.cgPath
        
        //cross part of crosshairs
        var drawPoint: CGPoint
        
        //draw vertical first
        drawPoint = CGPoint(x: self.crosshairsLayer.bounds.width/2, y: 0.0)
        circlePath.move(to: drawPoint)
        drawPoint.y = self.crosshairsLayer.bounds.height
        circlePath.addLine(to: drawPoint)
        
        //draw horizontal second
        drawPoint = CGPoint(x: 0, y: self.crosshairsLayer.bounds.size.height/2)
        circlePath.move(to: drawPoint)
        drawPoint.x = self.crosshairsLayer.bounds.width
        circlePath.addLine(to: drawPoint)
        
        self.crosshairsLayer.path = circlePath.cgPath
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
