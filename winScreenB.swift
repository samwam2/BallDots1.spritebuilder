//
//  winScreen.swift
//  BallDots
//
//  Created by Sam Showalter on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class winScreenB: CCNode {
    var SceneGrid = CCBReader.load("GridScene") as! GridScene
    func Next() {
        var currentLevelWin = SceneGrid.currentLevel
        let nextscreenScene = CCBReader.loadAsScene("GridScene\(currentLevelWin)")
        CCDirector.sharedDirector().presentScene(nextscreenScene)
        
    }
    
//    func nextLevel() {
//        
//        for  levelOne in 1...5 {
//            CCBReader.loadAsScene("Level/levelTwo")
//        }
//    }
}
