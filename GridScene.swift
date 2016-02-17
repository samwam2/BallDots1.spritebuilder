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
    weak var ball: CCNode!
    weak var dot: CCNode!
    weak var BlackDot: CCNode!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var winBox: CCNode!
    weak var LevelOnScreen: CCLabelTTF!
    weak var winLayer: CCNode!

   
    
    var currentLevel: Int = 1
    
//    init(currentLevel: Int) {
//        self.currentLevel = Int()
//    }
    
    var levleForLabel: Int = 0 //{
//        didSet {
//            LevelOnScreen.string = "\(levleForLabel)22"
//        }
//    }
    

    
    
    func didLoadFromCCB() {
        gamePhysicsNode.collisionDelegate = self
        aGridArray = CCBReader.load("Grid") as? Grid
        aGridArray!.setAll(10, rows: 6, spacing: 50)
        //var DeviceiPhonee = CCDevice.DeviceiPhone
//        randomWinBoxPlace()
//        winLayer.visible = true
        
      
//        if currentLevel == 1 {
//            generateDotsForLevel(currentLevel)
//            println("level 1")
//        } else {
//            println("Not level One")
//        }
        
        generateDotsForLevel(currentLevel)
        gamePhysicsNode.debugDraw = false
        
       CCBReader.load("Dot")
        CCBReader.load("blackDot")
    }
    
    //Has the range of levels and uses loadGridWithCode to put in to number of the distance apart and totalNumberOfBlackDots
    func generateDotsForLevel(levelNum: Int) {
        
        if currentLevel >= 1 && currentLevel <= 10 {
            loadGridWithCode(2, totalNumberOfBlackDots: 6)
            //gamePhysicsNode.addChild(ball)
            
            randomWinBoxPlace()
          
            print("Level 1 - 10 loaded succecsfully, Current level: \(currentLevel)")
            
        } else if currentLevel >= 11 && currentLevel <= 20 {
            loadGridWithCode(2, totalNumberOfBlackDots: 10)
            
        } else if currentLevel >= 21 && currentLevel <= 30 {
            loadGridWithCode(2, totalNumberOfBlackDots: 15)
             print("Level 1 - 10 loaded succecsfully, Current level: \(currentLevel)")
            
        } else if currentLevel ==  31 {
            let load = CCBReader.loadAsScene("winScreenB")
            CCDirector.sharedDirector().presentScene(load)
        } else {
            print("Level Failed to load")
            
        }
    }
    //Has all of the code to load the black and red dots for the lelvels
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
            //println("random \(x)")
            possibleBlackDotPoints[x].isBlackDot = true
            
           // println(index)
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
    }

    // Function for randomly loading the box
    func randomWinBoxPlace() {
        let winboxB = CCBReader.load("WinBox")
        let screenSize = CCDirector.sharedDirector().viewSize().width
        let winboxSize =  winboxB.contentSize.width
        let math = screenSize - winboxSize
        let randomNum = arc4random() % UInt32(math)
        winboxB.position = ccp(CGFloat(randomNum) ,CGFloat(0))
        gamePhysicsNode.addChild(winboxB)
    }
    
    // Back and retry are both buttons
    func back() {
        removeFromParentAndCleanup(true)
        let backScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(backScene)
    }
    
    //Retry is not wroking
    func retry() {
        //generateDotsForLevel(currentLevel)
    let backScene = CCBReader.loadAsScene("GridScene")
    CCDirector.sharedDirector().presentScene(backScene)

      generateDotsForLevel(currentLevel)
        
    }
    
   
    //ccPhysicsCollisionBegin when the collides with the win box
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, ballCollision: CCNode!, win: CCNode!) -> ObjCBool {
        
      currentLevel++
//        onEnter(dot.removeAllChildrenWithCleanup(true))

        
//        self.dot.removeAllChildrenWithCleanup(true)
//        self.winBox.removeAllChildrenWithCleanup(true)
//        self.ball.removeAllChildrenWithCleanup(true)
//        
//       self.BlackDot.removeAllChildrenWithCleanup(true)

        //removeAllChildrenWithCleanup(true)
        let backScene = CCBReader.loadAsScene("GridScene")
        CCDirector.sharedDirector().presentScene(backScene)
        
      
        
        generateDotsForLevel(currentLevel)

        
        
//        winLayer.visible = true
        
        //levleForLabel++
       // LevelOnScreen.string = String(levleForLabel)
        
        
        
        return true
    }
    



//class winScreen: GridScene {
    //weak var winLayer: CCNode!
    
    func NextLevel() {
       //currentLevel++
        winLayer.visible = false
    }
    
}
// class full of the extra old code
class extraStuff: CCNode {
    

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
}


