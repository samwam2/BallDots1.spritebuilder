//
//  blackDot.swift
//  BallDots
//
//  Created by Sam Showalter on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class blackDot: CCNode {
    weak var BlackDot: CCNodeColor! 
    
    func didloadFromCCB() {
        userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        removeAllChildrenWithCleanup(false)
        println("Touch on black dot")
    }
}