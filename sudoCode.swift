//
//  sudoCode.swift
//  BallDots
//
//  Created by ShowalterS18 on 1/31/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

import Foundation
import CoreGraphics

class sudoCode: CCNode {
   weak var fire = CCNode!()
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        fire?.visible = true
    }
    
    override func touchEnded(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        fire?.visible = false 
    }
}
