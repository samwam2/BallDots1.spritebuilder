//
//  GamePlay.swift
//  BallDots
//
//  Created by Sam Showalter on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class GamePlay: CCScene {
    //all vars here
    weak var dot: CCNodeColor!
    weak var ball: CCNode!

        //weak var Dot:CCNodeColor!
    
    var aGridArray:[[CGPoint]]?
    
    
    
    //all lets here

    func didLoadFromCCB() {
        //var grid = Grid(columns: 10, rows: 10, spacing: 10)
//        ball.physicsBody
    
        var grid = CCBReader.load("Grid") as! Grid
        aGridArray = grid.setAll(10, rows: 10, spacing: 50)
        for pointArray in aGridArray! {
            for point in pointArray {
                var temporaryDot = CCBReader.load("Dot")
                temporaryDot.position = point
                self.addChild(temporaryDot)
                //println("added dot at position \(temporaryDot.position)")
            }
        }
        //CCBReader.load("Dot")
        userInteractionEnabled = true
    }

    
    /*
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        var touchLocation = dot
        for array in aGridArray! {
            for dot in array {
                var temporaryRect = CGRect(x: dot.x, y: dot.y, width: 7.5, height: 7.5) //7.5
                if temporaryRect.contains(touch.locationInWorld()) {
                    println("worked")
                    println("touch location \(temporaryRect)")
                    
                    
                }
            }
        }
    }
*/
    
    
    //last closing bracket all new code ^
}