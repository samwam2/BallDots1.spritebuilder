//
//  levelFour.swift
//  BallDots
//
//  Created by Sam Showalter on 7/27/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class levelFour: CCNode {
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
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Ball: CCNode!, lose: CCNodeColor!) -> ObjCBool {
        //retry()
        return true
        
    }
    
    func back() {
        let backScene = CCBReader.loadAsScene("LevelScene")
        CCDirector.sharedDirector().presentScene(backScene)
    }
    
    func retry() {
        let retrylevelScene = CCBReader.loadAsScene("Levels/levelTwo")
        CCDirector.sharedDirector().presentScene(retrylevelScene)
    }

}