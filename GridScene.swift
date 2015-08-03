//
//  GridScene.swift
//  BallDots
//
//  Created by Sam Showalter on 7/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class GridScene: CCNode { //, CCPhysicsCollisionDelegate {
    var aGridArray:[[CGPoint]]?
    weak var ball: CCNode!
    weak var dot: CCNode!
    weak var BlackDot: CCNode!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var winBox: CCNode!
    var currentLevel: Int = 1
    
    var blackDotTotal = 0
    var redDotTotal = 0
    var randomLoad = random()
    
    
    
    func didLoadFromCCB() {
    var grid = CCBReader.load("Grid") as! Grid
    aGridArray = grid.setAll(10, rows: 6, spacing: 50)
        gamePhysicsNode.collisionDelegate = self
        currentLevel = 1
        randomWinBoxPlace()
        generateDotsForLevel(currentLevel)

        
        dot.anchorPoint.getMirror()
    for pointArray in aGridArray! {
        
        //resets the blackDotTotal to 0 in each row
        var blackDotTotal = 0
        
        for point in pointArray {

            var dotType = ""
            
            switch Int.random(min: 1, max: 2)
            {
            case 1:
                dotType = "blackDot"
                blackDotTotal++
            case 2:
                dotType = "Dot"
                redDotTotal++
            default:
                println("Unknown DotType")
            }
            
            
            if blackDotTotal > 2 && dotType == "blackDot" {
                dotType = "Dot"
            }
            
            var temporaryDot = CCBReader.load(dotType)
            temporaryDot.position = point
            //temporaryDot.ball = ball
            gamePhysicsNode.addChild(temporaryDot)
        }
    }
        println("how many red dots there are\(redDotTotal)")
        println("\(currentLevel)")

        CCBReader.load("Dot")
        CCBReader.load("blackDot")
    }
    
    
    // 2 and 5
    // if for levels
    
    func generateDotsForLevel(levelNum: Int) {
//        var distanceApart = distance(start: dot, end: BlackDot)
        var distanceApart: Int
        
//        var blackDotTotal = 0
        
//        for currentLevel in 1...10 {
//            distanceApart = 3
//            blackDotTotal = 5
//            if blackDotTotal > 5 && dotType == "blackDot" {
//                dotType = "Dot"
//            }
//            println("\(distanceApart) asfasfasf   \(blackDotTotal)")
//        }
//        for currentLevel in 11...20 {
//            distanceApart = 3
//            blackDotTotal = 5
//        }
//        for currentLevel in 21...30 {
//            distanceApart = 3
//            blackDotTotal = 5
//        }
        
        if currentLevel == 1 {
            distanceApart = 3
//            blackDotTotal = 6
            println("this worked")
            
            //didLoadFromCCB()
        } else if currentLevel == 11-20 {
            distanceApart = 2
            blackDotTotal = 10
        } else if currentLevel == 21-30 {
            distanceApart = 2
            blackDotTotal = 12
        } else {
            println("this failed")
            
        }

    }
    

    
    // Function for randomly loading the box
    func randomWinBoxPlace() {
        var winboxB = CCBReader.load("WinBox")
        var screenSize = CCDirector.sharedDirector().viewSize().width
        var winboxSize =  winboxB.contentSize.width
        var math = screenSize - winboxSize
       // println("\(screenSize) \(winboxSize)")
        var randomNum = arc4random() % UInt32(math)
        winboxB.position = ccp(CGFloat(randomNum) ,CGFloat(0))
        gamePhysicsNode.addChild(winboxB)
    }

    func back() {
        let backScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(backScene)
    }
    func retry() {
        let retryScene =  CCBReader.loadAsScene("GridScene")
       CCDirector.sharedDirector().presentScene(retryScene)
    }
    
    func ccPhysicsCollisionPostSolve(pair: CCPhysicsCollisionPair!, ballCollision: CCNode!, win: CCNode!) -> ObjCBool{
        currentLevel++
       winthing()
        
        return true
    }

    func winthing() {
        let winscene = CCBReader.loadAsScene("winScreenB")
        CCDirector.sharedDirector().presentScene(winscene)
    }
}
