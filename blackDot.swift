//
//  blackDot.swift
//  BallDots
//
//  Created by Sam Showalter on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//
import UIKit
import Foundation

class blackDot: CCNode {
    weak var BlackDot: CCNode!
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = false
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        //turn off before upload to testflight
        removeFromParentAndCleanup(false)
    }
}