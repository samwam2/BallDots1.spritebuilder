//
//  winScreen.swift
//  BallDots
//
//  Created by Sam Showalter on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class winScreenB: CCNode { // CCNode
    
    var SceneGrid = CCBReader.load("GridScene") as! GridScene
//    func Next() {
//        var currentLevelWin = SceneGrid.currentLevel
//        
////        let nextscreenScene = CCBReader.loadAsScene("GridScene\(currentLevelWin)")
////        CCDirector.sharedDirector().presentScene(nextscreenScene)
//        
//    }
    
    func Next() {
        let nextScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(nextScene)
    }
    
    func nextLevel() {
        var currentLevel: NSInteger = SceneGrid.currentLevel
       // var generateDotsForLevel = SceneGrid.generateDotsForLevel(currentLevel)
      
//        SceneGrid.currentLevel.advancedBy(1)
       let nextLevelScene = CCBReader.loadAsScene("GridScene")//.currentLevell
        CCDirector.sharedDirector().presentScene(nextLevelScene)
        SceneGrid.generateDotsForLevel(currentLevel)
        
    }
    
    
    
//    func nextLevel() {
//        
//        for  levelOne in 1...5 {
//            CCBReader.loadAsScene("Level/levelTwo")
//        }
//    }
}
