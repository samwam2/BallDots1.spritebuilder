# BallDots1.spritebuilder
Game
p1: GDD
p2: Grid Model
p3: Dynamically loading in square from SB using Grid Model

## Game Design
### Objective
To have 1 player connect dots in a grid to make a ball go down a path to reach the end of the level

### Gameplay Mechanics
The gameplay mechanics are have a grid setup to have the player connect them to move a ball.

### Level Design
Have the dots / grid setup in different ways.

## Technical
### Scenes
* Gameplay Scene (p1)
* Man Menu (p4)
* Level scene(p5)

### Controls/Input
* Tap two dots consecutively, form a line (barrier) between the two

### Classes/CCBs
* Classes
  * Gameplay
  * Grid
     
* Nodes/Sprites
  * Dots (squares)

## MVP Milestones

### Week 4 (7/13 - 7/17/2015) - _finishing a playable build_
* Make a 2D grid, where you can specify the number of rows and columns
  * makeGrid(x: numberOfRows, y: numberOfColumns)
* Put in background
* Add diffrent colors 
* Add touch controlls 

### Week 5 (7/20 - 7/24/2015)
* Add a ball to roll down
* Add graphics for everything 

### Week 6 (7/27 - 8=7/31/2015) - _finishing core gameplay_
* Make a main menu 
* Make a level  screen 
* Make levels 

### Week 7 (8/4 - 8/7/2015)
* Determine what other polish is needed
* Fix stuff

### Week 8 (8/10 - 8/15/2014) - _finishing the polish_
* Check for all bugs
* Integrate analytics
* Screenshots
* Write game description for App store
* Upload to App store for review 
* Play around with Apportable to see if Android release is feasible
