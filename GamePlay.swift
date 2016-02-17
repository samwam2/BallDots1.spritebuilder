//
//  GamePlay.swift
//  BallDots
//
//  Created by Sam Showalter on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import Mixpanel

class GamePlay: CCScene, CCPhysicsCollisionDelegate {
    //all vars here
    weak var dot: CCNode!
    weak var ball: CCNode!
    weak var Win: CCNodeColor!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var levelNode: CCNode!
    weak var contentNode: CCNode!
    var level = CCBReader.loadAsScene("Levels/level1")
//Character = 1
    var currentLevel: Int = 1
   // var currentLevelPath = "Levels/level\(currentLevel)"
    //all lets here
    let mixpanel = Mixpanel.sharedInstanceWithToken("78c883b9d8e9f8c5306e60c8b0b72833")


    func didLoadFromCCB() {
    
        userInteractionEnabled = true
        //gamePhysicsNode.debugDraw = true
        gamePhysicsNode.collisionDelegate = self
        levelNode.addChild(level)
        mixpanel.track("Played the game")
    }
    
    
    //Buttons in the screen
    func retry() {
        whatLevel()
    }
    func Back() {
        let backscene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(backscene)
    }
    
    
    func ccPhysicsCollisionPostSolve(pair: CCPhysicsCollisionPair!, ball: CCNode!, win: CCNode!) {
        currentLevel++
        print("\(currentLevel)")
        whatLevel()
    }
    
    func whatLevel() {
        let levelLoad: CCScene = CCBReader.loadAsScene("Levels/level\(currentLevel)")
        levelNode.removeChild(level)
        level = levelLoad
        levelNode.addChild(level)
        
//        CCDirector.sharedDirector().viewSize().width - level.contentSize.width

        
        
//        if currentLevel == 1 {
//            var levelLoad: CCScene = CCBReader.loadAsScene("Levels/level1")
//            levelNode.removeChild(level)
//            level = levelLoad
//            levelNode.addChild(level) 
//        } else if currentLevel == 2 {
//            var levelLoad: CCScene = CCBReader.loadAsScene("Levels/level2")
//            levelNode.removeChild(level)
//            level = levelLoad
//            levelNode.addChild(level)
//        } else if currentLevel == 3 {
//            var levelLoad: CCScene = CCBReader.loadAsScene("Levels/level3")
//            levelNode.removeChild(level)
//            level = levelLoad
//            levelNode.addChild(level)
//        } else if currentLevel == 4 {
//            var levelLoad: CCScene = CCBReader.loadAsScene("Levels/level4")
//            levelNode.removeChild(level)
//            level = levelLoad
//            levelNode.addChild(level)
//        } else {
//            println("this failed")
//            levelNode.removeChild(level)
//        }
        
    }
    
    
    //last closing bracket all new code ^
}


