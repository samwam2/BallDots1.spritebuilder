//
//  GamePlay.swift
//  BallDots
//
//  Created by Sam Showalter on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//
import Foundation
import UIKit
import GameKit

class MainScene: CCNode, CCPhysicsCollisionDelegate { //, GKGameCenterControllerDelegate {
    //all vars here
    
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var ball: CCNode!
   
    //all lets here
    
    
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        setUpGameCenter()
        
    }
    func setUpGameCenter() { let gameCenterInteractor = GameCenterInteractor.sharedInstance; gameCenterInteractor.authenticationCheck()
    
    }
    
    func openGameCenter() {
        showLeaderboard()
    }
    
    func StartGame() {
        let gameplayScene = CCBReader.loadAsScene("GridScene")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }
    
    func AboutTheGame() {
        let aboutthegameScene = CCBReader.loadAsScene("AboutGame")
        CCDirector.sharedDirector().presentScene(aboutthegameScene)
    
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ballCollision: CCNode!, resetBall: CCNodeColor!) -> ObjCBool {
        ball.position = CGPoint(x: 157, y: 591)
        return true
    }
    
   // All share button code
    func shareButtonTapped() {
        var scene = CCDirector.sharedDirector().runningScene
        var n: AnyObject = scene.children[0]
        var image = screenShotWithStartNode(n as! CCNode)
        let sharedText = "Come Play The Dot Challenge, http://tinyurl.com/balldots"
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

    
   
    
    
    
    
    
    //last closing bracket all new code ^
}

extension MainScene: GKGameCenterControllerDelegate {
    func showLeaderboard() {
        var viewController = CCDirector.sharedDirector().parentViewController!
        var gameCenterViewController = GKGameCenterViewController()
        gameCenterViewController.gameCenterDelegate = self
        viewController.presentViewController(gameCenterViewController, animated: true, completion: nil)
    }
    
    // Delegate methods
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController!) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}

