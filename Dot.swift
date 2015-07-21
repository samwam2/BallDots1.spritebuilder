//
//  Dot.swift
//  BallDots
//
//  Created by Sam Showalter on 7/16/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit
import Foundation


class Dot: CCNode {
    weak var dot: CCNodeColor!
    var location = CGPoint(x: CGFloat(), y: CGFloat())
   
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        println("regular touch")
        //var touchLocation = touch.locationInNode(self)
        removeFromParentAndCleanup(true)
       
        println("removed at \(removeFromParentAndCleanup(true))")
//        if self.dot > 5 {
//            removeFromParentAndCleanup(false)
//        }
    }
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        println("touched moved")
        
    }
    
   
}
