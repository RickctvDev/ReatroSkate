//
//  GameScene.swift
//  Retro Skater
//
//  Created by Rick Crane on 29/01/2016.
//  Copyright (c) 2016 Rick Crane. All rights reserved.
// TESTING TO SEE WHAT I CAN LEARN

import SpriteKit

class GameScene: SKScene {
    
    var backgroundsArray = [SKSpriteNode]()
    
    override func didMoveToView(view: SKView) {
        makeBackground()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
       
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        print(backgroundsArray.count)
    }
    
    
    func makeBackground(){
        var background = SKSpriteNode()
        
        //VALUES TO CHANGE POSITIONING
        let BACKGROUND_BASE_VALUE: CGFloat = 60
        let MID_BG_POS: CGFloat = 35
        let FAR_BG_POS: CGFloat = 65
        
        //ITERATE THROUGH TO MAKE THE BACKGROUNDS AND APPEND TO ARRAY
        for var i = 0; i < 3; i++ {
            for var x = 0; x < 3; x++ {
                background = SKSpriteNode(imageNamed: "bg\(i)")
                background.anchorPoint = CGPointMake(0.5, 0)
                background.zPosition = CGFloat(-i)
                
                
                ////////////////////FIX THIS SECTION////////////////////
                if backgroundsArray.count == 0{
                    background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMinY(self.frame) + BACKGROUND_BASE_VALUE)
                }else{
                    background.position = CGPointMake(CGRectGetMidY(self.frame), CGRectGetMinY(self.frame) + BACKGROUND_BASE_VALUE)
                }
                
                backgroundsArray.append(background)
                self.addChild(background)
            }
        }
        //POSTITION THEM IN PLACE
        if backgroundsArray.count == 9 {
            backgroundsArray[0].position = background.position
            backgroundsArray[1].position = CGPoint(x: background.position.x, y: background.position.y + MID_BG_POS)
            backgroundsArray[2].position = CGPoint(x: background.position.x, y: background.position.y + FAR_BG_POS)
        }
        
        let moveBG = SKAction.moveByX(-50, y: 0, duration: 0.2)
        let moveBGForever = SKAction.repeatActionForever(moveBG)
        background.runAction(moveBGForever)
        
    }
}
