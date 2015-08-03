//
//  WinBox.swift
//  BallDots
//
//  Created by Sam Showalter on 7/30/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class WinBox: CCNode {
    weak var winBox: CCNode!

   func didLoadFromCCB() {
    self.userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        
    }
   
    
}