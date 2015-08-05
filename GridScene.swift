//
//  GridScene.swift
//  BallDots
//
//  Created by Sam Showalter on 7/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import CoreGraphics

class GridScene: CCNode, CCPhysicsCollisionDelegate {
    var aGridArray: Grid?
//    var gridArray: [[CGPoint]]? //CGPoint
    weak var ball: CCNode!
    weak var dot: CCNode!
    weak var BlackDot: CCNode!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var winBox: CCNode!
    var currentLevel: Int = 1
    
    var blackDotTotal = 0
    var redDotTotal = 0
    var randomLoad = random()
    var numberOfBlackDotsPerRow: Int = 0
    
    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        aGridArray = CCBReader.load("Grid") as? Grid
        aGridArray!.setAll(10, rows: 6, spacing: 50)
        currentLevel = 1
        //randomWinBoxPlace()
        generateDotsForLevel(currentLevel)
        gamePhysicsNode.debugDraw = false
        
        dot.anchorPoint.getMirror()

        println("how many red dots there are\(redDotTotal)")
        println("\(currentLevel)")
        
       
        
        CCBReader.load("Dot")
        CCBReader.load("blackDot")
    }
    
    
    // 2 and 5
    // if for levels
    
    func generateDotsForLevel(levelNum: Int) {

        var distanceApart: Int
        //var distance: CGFloat = ccpDistance(dot.position, BlackDot.position)
        loadGridWithCode(2, totalNumberOfBlackDots: 10)
        var redDot = CCBReader.load("Dot")
//        redDotTotal.position = CGPoint()
      
        //println("\(distanceApart)")
//        var blackDotTotal = 0
        
        if currentLevel >= 1 && currentLevel <= 10 {
            distanceApart = 3
            blackDotTotal = 10
            numberOfBlackDotsPerRow = 1
            println("this worked")
            let distanceApart = 2

//            loadGridWithCode(distanceApart, totalNumberOfBlackDots: 10)
            
        } else if currentLevel >= 11 && currentLevel <= 20 {
            distanceApart = 2
            blackDotTotal = 10
        } else if currentLevel >= 21 && currentLevel <= 30 {
            distanceApart = 2
            blackDotTotal = 12
        } else {
            println("this failed")
            
        }
    }
    
    func loadGridWithCode(distanceApart: Int, totalNumberOfBlackDots: Int) {
        //find all valid spots for black dots based on given parameters (distanceApart)
        var possibleBlackDotPoints = [GridPoint]()
        let rows = aGridArray?.rows
        let columns = aGridArray?.columns
        for var row = 0; row < rows; row++ {
            for var column = 0; column < columns; column++ {
                if row % distanceApart == 0 && column % distanceApart == 0 {
                    possibleBlackDotPoints.append(((aGridArray?.grid[row])! as [GridPoint])[column])
                }
            }
        }
        
        //select totalNumberOfBlackDots randomly from list of all possible locations
        for index in 0..<totalNumberOfBlackDots {
            let x = Int.random(min: 0, max: possibleBlackDotPoints.count - 1) //random number DONE
            println("random \(x)")
            possibleBlackDotPoints[x].isBlackDot = true
            println(index)
        }
        
        for var row = 0; row < rows; row++ {
            for var column = 0; column < columns; column++ {
                let gridDot = aGridArray?.grid[row][column]
                var dot: CCNode
                if gridDot!.isBlackDot {
                    dot = CCBReader.load("blackDot")
                } else {
                    dot = CCBReader.load("Dot")
                }
                dot.position = (gridDot?.point)!
                gamePhysicsNode.addChild(dot)
            }
        }
        
        
        
        
//        for
        
//            //setup grid based possibleBlackDotPoints & contents of aGridArray
//        //...
//            for index  in aGridArray?.grid {
//                
//            //resets the blackDotTotal to 0 in each row
//            var blackDotTotal = 0
//            
//            for point in possibleBlackDotPoints {
//                
//                var dotType = ""
//                
//                switch Int.random(min: 1, max: 2)
//                {
//                case 1:
//                    dotType = "blackDot"
//                    blackDotTotal++
//                case 2:
//                    dotType = "Dot"
//                    redDotTotal++
//                default:
//                    println("Unknown DotType")
//                }
//                
//                
//                if blackDotTotal > numberOfBlackDotsPerRow && dotType == "blackDot" {
//                    dotType = "Dot"
//                }
//                var distance = ccpDistance(point, point)
//                var temporaryDot = CCBReader.load(dotType)
//                temporaryDot.position = point
//                //temporaryDot.ball = ball
//                gamePhysicsNode.addChild(temporaryDot)
//                }
//            
//            } }

        }
    
//    func loadGridWithCode() {
//
        //find all valid spots for black dots based on given parameters (distanceApart)
//        for var row = 0; row < aGridArray.rows; index++ {
//
//        }
//
//        //deciding if dot is black
//        for index in 0..<(aGridArray?.count)! {
//            let x = 3 //rand x
//            let y = 4 //rand y
//            
////            aGridArray![x][y].isBlackDot = true
//        }
//        
//        //setting dots in grid
////        for column in aGridArray {
////            if dot.isBlackDot {
////                //load in black dat
////            } else {
////                //load in red dot
////            }
//        }
//        
//        var grid = CCBReader.load("Grid") as! Grid
////        aGridArray = grid.setAll(10, rows: 6, spacing: 50)
//        for pointArray in aGridArray! {
//            
//            //resets the blackDotTotal to 0 in each row
//            var blackDotTotal = 0
//            
////            for point in pointArray {
//    
//                var dotType = ""
//                
//                switch Int.random(min: 1, max: 2)
//                {
//                case 1:
//                    dotType = "blackDot"
//                    blackDotTotal++
//                case 2:
//                    dotType = "Dot"
//                    redDotTotal++
//                default:
//                    println("Unknown DotType")
//                }
//                
//                
//                if blackDotTotal > numberOfBlackDotsPerRow && dotType == "blackDot" {
//                    dotType = "Dot"
//                }
//                var distance = ccpDistance(point, point)
//                var temporaryDot = CCBReader.load(dotType)
//                temporaryDot.position = point
//                //temporaryDot.ball = ball
//                gamePhysicsNode.addChild(temporaryDot)
////            }
//    
//    }


    
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
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ballCollision: CCNode!, win: CCNode!) -> Bool {
        currentLevel++
        //winthing()
        
        return true
    }

    func winthing() {
        let winscene = CCBReader.loadAsScene("winScreenB")
        CCDirector.sharedDirector().presentScene(winscene)
        }

}
