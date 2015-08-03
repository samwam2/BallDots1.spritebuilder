//
//  winScreen.swift
//  BallDots
//
//  Created by Sam Showalter on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class winScreenB: CCNode {
    
    func Next() {
        let nextscreenScene = CCBReader.loadAsScene("GridScene")
        CCDirector.sharedDirector().presentScene(nextscreenScene)
    }
    
//    func nextLevel() {
//        
//        for  levelOne in 1...5 {
//            CCBReader.loadAsScene("Level/levelTwo")
//        }
//    }
}
