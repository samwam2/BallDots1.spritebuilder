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
    weak var dot: CCNode!
    var location = CGPoint(x: CGFloat(), y: CGFloat())
    weak var counter: CCLabelTTF!
    
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        //println("regular touch")
        //var touchLocation = touch.locationInNode(self)
        
        var ball:Ball = self.parent.getChildByName("ball", recursively: true) as! Ball
        ball.physicsBody.applyImpulse(ccp(30,30))
        
        removeFromParentAndCleanup(true)
        
    }
    
}

