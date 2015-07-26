//
//  levelOne.swift
//  BallDots
//
//  Created by Sam Showalter on 7/24/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import CoreMotion

class levelOne: CCNode, CCPhysicsCollisionDelegate {
    //let nextLevel = CCBReader.loadAsScene("winScreen")
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var Ball: CCNode!
    
    func home() {
        let homeScene = CCBReader.loadAsScene("LevelScene")
        CCDirector.sharedDirector().presentScene(homeScene)
    }
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
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Ball: CCNode!, Wall: CCNodeColor!) -> Bool {
        let energy = pair.totalKineticEnergy
        
        //        println("Ball hit the wall and it worked ish")
        //energy.Ball
        return true

    }
    
    func retrylevel() {
        let retrylevelScene = CCBReader.loadAsScene("Levels/levelOne")
        CCDirector.sharedDirector().presentScene(retrylevelScene)
    }
    
//    func setupDeviceMotion() {
//        //make sure device has motion capabilities
//        if manager.deviceMotionAvailable {
//            //set the number of times the device should update motion data (in seconds)
//            manager.deviceMotionUpdateInterval = 0.01
//            //setup callback for everytime the motion data is updated
//            manager.startDeviceMotionUpdatesToQueue(queue, withHandler: { (motion: CMDeviceMotion!, error: NSError!) -> Void in
//                ///checking device attitude will allow us to check devices current orientation in 3D space
//                var attitude = motion.attitude
//                self.Ball.position.x += CGFloat(attitude.roll * 3)
//            })
//        }
//    }
    
    
}