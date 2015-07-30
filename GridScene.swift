//
//  GridScene.swift
//  BallDots
//
//  Created by Sam Showalter on 7/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class GridScene: CCNode {
    var aGridArray:[[CGPoint]]?
    weak var ball: CCNode!
    weak var dot: CCNode!
    weak var BlackDot: CCNode!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var winBox: CCNode! 
    var blackDotTotal = 0
    var redDotTotal = 0
    var randomLoad = random()
    

    
    func didLoadFromCCB() {
    var grid = CCBReader.load("Grid") as! Grid
    aGridArray = grid.setAll(10, rows: 6, spacing: 50)
        
        
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
        var winboxb = CCBReader.load("WinBox")
        gamePhysicsNode.addChild(winboxb)
        winboxb.positionInPoints = CGPoint(x: 10, y: 50)

        CCBReader.load("Dot")
        CCBReader.load("blackDot")
    }
    
    func back() {
        let backScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(backScene)
    }
    
    
    
    func retry() {
        let retryScene =  CCBReader.loadAsScene("GridScene")
       CCDirector.sharedDirector().presentScene(retryScene)
    }
    
}