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
    func setUpGameCenter() {
        let gameCenterInteractor = GameCenterInteractor.sharedInstance; gameCenterInteractor.authenticationCheck()
    
    }
    // All button funcs
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
    func tutButton() {
        let tutScene = CCBReader.loadAsScene("tutroial")
        CCDirector.sharedDirector().presentScene(tutScene)
        
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ballCollision: CCNode!, resetBall: CCNodeColor!) -> ObjCBool {
        ball.position = CGPoint(x: 157, y: 591)
        return true
    }
    
   // All share button code
    func shareButtonTapped() {
        let scene = CCDirector.sharedDirector().runningScene
        let n: AnyObject = scene.children[0]
        let image = screenShotWithStartNode(n as! CCNode)
        let sharedText = "Come Play The Dot Challenge, http://tinyurl.com/balldots"
        let itemsToShare = [image, sharedText]
        let excludedActivities = [UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
            UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList, UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop]
        let controller = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        controller.excludedActivityTypes = excludedActivities
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(controller, animated: true, completion: nil)
    }
    
    func screenShotWithStartNode(node: CCNode) -> UIImage {
        CCDirector.sharedDirector().nextDeltaTimeZero = true
        let viewSize = CCDirector.sharedDirector().viewSize()
        let rtx = CCRenderTexture(width: Int32(viewSize.width), height: Int32(viewSize.height))
        rtx.begin()
        node.visit()
        rtx.end()
        return rtx.getUIImage()
    }

 
   
    
    
    
    
    
    //last closing bracket all new code ^
}

extension MainScene: GKGameCenterControllerDelegate {
    func showLeaderboard() {
        let viewController = CCDirector.sharedDirector().parentViewController!
        let gameCenterViewController = GKGameCenterViewController()
        gameCenterViewController.gameCenterDelegate = self
        viewController.presentViewController(gameCenterViewController, animated: true, completion: nil)
    }
    
    // Delegate methods
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}

