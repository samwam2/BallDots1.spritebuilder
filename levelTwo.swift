//
//  levelTwo.swift
//  BallDots
//
//  Created by Sam Showalter on 7/26/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class levelTwo: CCNode {
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var Ball: CCNode!
    
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        //CMMotionManager
        
    }
    func winThing() {
        let winscreenwin = CCBReader.loadAsScene("winScreenB")
        CCDirector.sharedDirector().presentScene(winscreenwin)
    }
    
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Ball: CCNode!, win: CCNode!) -> ObjCBool {
        winThing()
        return true
        
    }
    
    func back() {
        let homeScene = CCBReader.loadAsScene("LevelScene")
        CCDirector.sharedDirector().presentScene(homeScene)
    }
    
    func retry() {
        let retrylevelScene = CCBReader.loadAsScene("Levels/levelOne")
        CCDirector.sharedDirector().presentScene(retrylevelScene)
    }

}