//
//  GamePlay.swift
//  BallDots
//
//  Created by Sam Showalter on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//
import Foundation
import UIKit

class MainScene: CCNode, CCPhysicsCollisionDelegate {
    //all vars here
    
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var ball: CCNode!
   
    //all lets here
    
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        
    }
    func StartGame() {
        let gameplayScene = CCBReader.loadAsScene("GridScene")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
    
    func AboutTheGame() {
        let aboutthegameScene = CCBReader.loadAsScene("AboutGame")
        CCDirector.sharedDirector().presentScene(aboutthegameScene)
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ballCollision: CCNode!, resetBall: CCNodeColor!) -> Bool {
        ball.position = CGPoint(x: 157, y: 591)
        return true
    }
    
    //All share button code
    func shareButtonTapped() {
        var scene = CCDirector.sharedDirector().runningScene
        var n: AnyObject = scene.children[0]
        var image = screenShotWithStartNode(n as! CCNode)
        let sharedText = "Share text"
        let itemsToShare = [image, sharedText]
        var excludedActivities = [UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
            UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList, UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop]
        var controller = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        controller.excludedActivityTypes = excludedActivities
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(controller, animated: true, completion: nil)
    }
    
    func screenShotWithStartNode(node: CCNode) -> UIImage {
        CCDirector.sharedDirector().nextDeltaTimeZero = true
        var viewSize = CCDirector.sharedDirector().viewSize()
        var rtx = CCRenderTexture(width: Int32(viewSize.width), height: Int32(viewSize.height))
        rtx.begin()
        node.visit()
        rtx.end()
        return rtx.getUIImage()
    }

    
//    func gridButton() {
//        let gridbuttonScene = CCBReader.loadAsScene("GridScene")
//        CCDirector.sharedDirector().presentScene(gridbuttonScene)
//    }
    
    //last closing bracket all new code ^
}
