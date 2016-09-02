//
//  GameScene.swift
//  Flappy Bird
//
//  Created by Júlio Gabriel Chilela on 8/13/16.
//  Copyright (c) 2016 Júlio Gabriel Chilela. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
     var viewController: UIViewController?
    
    //var pauseButton = SKSpriteNode(imageNamed: "pause2.jpeg")
    
    //-------- HIGH SCORE ---------
     var HighScoreLabel = SKLabelNode()
     let defaults=NSUserDefaults()
    //---------HIGH SCORE --------
    
    
    var score = 0
    
    
    var life = 3
    
    
    var scoreLabel = SKLabelNode()
    
    var lifeLabel = SKLabelNode()
    
    
    var button = SKSpriteNode(imageNamed: "iniciar.png")
    //Nivel ________
    var buttonAlterarNivel = SKSpriteNode(imageNamed: "nivel.png")
    var nivelLabel = SKLabelNode()
    // _____________
   
    
     var gameOverLabel = SKLabelNode()
    var gameOverLabelScore = SKLabelNode()
  
    //TO ADD SOMETHING ON SCREEN USE A NODE
    var bird = SKSpriteNode()
    
    //For the background 
    var bg  = SKSpriteNode()
    
    //PIPES
    
    var pipe1 = SKSpriteNode()
    var pipe2 = SKSpriteNode()
    
    var movingObjects = SKSpriteNode()
    
    var labelContainer = SKSpriteNode()
    
    enum ColliderType: UInt32 {
        case Bird = 1
        case Object = 2
        case Gap = 4
        
        // If you have more types give a number doble of two.
    
    }
    
    var gameOver = false
    
    
    
    
    
    func makeBackground()  {
        //Loading the chosen level
        let level = defaults.integerForKey("level")
        
        //LEVEL 1______________________________
        
        if level == 1{
        
       
        //BACKGROUND IMAGE
        let bgTexture = SKTexture(imageNamed: "1cunene.png")
         
        
        let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        
        //TO REPEAT THE IMAGE IN BACKGROUND
        let replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        
        let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
        
        
        
        for var i: CGFloat = 0; i < 3; i++ {
            
            bg = SKSpriteNode(texture: bgTexture)
            
            bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i , y: CGRectGetMidY(self.frame))
            
            bg.size.height = self.frame.height // Make the background to stretch to all screen
            bg.zPosition = -5
            bg.runAction(movebgForever)
            
            movingObjects.addChild(bg)
            
        }
        } else if level == 2{
            
            
            //BACKGROUND IMAGE
            let bgTexture = SKTexture(imageNamed: "bkg.png")
            
            
            let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
            
            //TO REPEAT THE IMAGE IN BACKGROUND
            let replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
            
            let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
            
            
            
            for var i: CGFloat = 0; i < 3; i++ {
                
                bg = SKSpriteNode(texture: bgTexture)
                
                bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i , y: CGRectGetMidY(self.frame))
                
                bg.size.height = self.frame.height // Make the background to stretch to all screen
                bg.zPosition = -5
                bg.runAction(movebgForever)
                
                movingObjects.addChild(bg)
                
            }
        }else if level == 3{
            
            
            //BACKGROUND IMAGE
            let bgTexture = SKTexture(imageNamed: "2huila.png")
            
            
            let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
            
            //TO REPEAT THE IMAGE IN BACKGROUND
            let replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
            
            let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
            
            
            
            for var i: CGFloat = 0; i < 3; i++ {
                
                bg = SKSpriteNode(texture: bgTexture)
                
                bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i , y: CGRectGetMidY(self.frame))
                
                bg.size.height = self.frame.height // Make the background to stretch to all screen
                bg.zPosition = -5
                bg.runAction(movebgForever)
                
                movingObjects.addChild(bg)
                
            }
        }

    }
    
    
    
    
    var isStarting = true
    var firstTouch = true // Lets track if the user touch the screen for the first time but not in the button start
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if firstTouch == true{
        
        makeBird()
        
        
        //Add the ground. It will be invisible. A boddy that collides with it will not disappear from the screen.
        var ground = SKNode()
        ground.position = CGPointMake(0, 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1)) // Remove the gravity from the ground
        ground.physicsBody?.dynamic = false
        
        
        ground.physicsBody?.categoryBitMask = ColliderType.Object.rawValue
        ground.physicsBody?.contactTestBitMask = ColliderType.Object.rawValue
        ground.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
        self.addChild(ground)
        
        
        
        
        
        
        //IF you want to INCREASE THE LEVEL OF THE DIFFICULT INCREASE THE TYME HERE
        _ = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("makePipes"), userInfo: nil, repeats: true)
        isStarting = false
        firstTouch = false
        }
        
        button.removeFromParent()
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if button.containsPoint(location) && isStarting == true {
                
                makeBird()
                
                
                //Add the ground. It will be invible. A boddy that collides with it will not disappear from the screen.
                var ground = SKNode()
                ground.position = CGPointMake(0, 0)
                ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1)) // Remove the gravity from the ground
                ground.physicsBody?.dynamic = false
                
                
                ground.physicsBody?.categoryBitMask = ColliderType.Object.rawValue
                ground.physicsBody?.contactTestBitMask = ColliderType.Object.rawValue
                ground.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
                self.addChild(ground)
                
                
                
                
                
                
                //IF you want to INCREASE THE LEVEL OF THE DIFFICULT INCREASE THE TYME HERE
                _ = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("makePipes"), userInfo: nil, repeats: true)
                isStarting = false

            }
            
            
            
            //IF NIVEL IS CLICKED
            
            for touch: AnyObject in touches {
                // Get the location of the touch in this scene
                let location = touch.locationInNode(self)
                // Check if the location of the touch is within the button's bounds
                if buttonAlterarNivel.containsPoint(location){
             
                // Call the nivel segue
                    viewController?.performSegueWithIdentifier("nivel", sender: self)
                }
            }

            
            
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    override func didMoveToView(view: SKView) {
        
        
        
        
               // Put it in the center of the scene
        button.position = CGPoint(x:CGRectGetMidX(self.frame), y:self.frame.size.height - self.frame.size.height/2);
        button.name = "Click me"
        self.addChild(button)
        
        
        // Add button to change the level
        buttonAlterarNivel.position = CGPointMake(CGRectGetMidX(self.frame) - self.frame.size.width/7 + 300, CGRectGetMidY(self.frame) - self.frame.size.height/2 + 7 + self.frame.size.height/7)
        buttonAlterarNivel.name = "Level"
        self.addChild(buttonAlterarNivel)
        
        //Level LABEL
        nivelLabel.fontName = "Helvetica"
        nivelLabel.fontSize = 18
        nivelLabel.text =  String(defaults.integerForKey("level"))
        nivelLabel.zPosition = 100
        nivelLabel.fontColor = UIColor.yellowColor()
        nivelLabel.position = CGPointMake(CGRectGetMidX(self.frame) - self.frame.size.width/7 + 345, CGRectGetMidY(self.frame) - self.frame.size.height/2  + self.frame.size.height/7)
        
        self.addChild(nivelLabel)
        
        
        
        
        
        
        
        self.physicsWorld.contactDelegate = self
        self.addChild(movingObjects)
        self.addChild(labelContainer)
        
        makeBackground()
        
        //SCORE LABEL
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 18
        scoreLabel.text = "Pontos: 0"
        scoreLabel.zPosition = 100
        scoreLabel.fontColor = UIColor.yellowColor()
        scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame) - self.frame.size.width/7 - 10, CGRectGetMidY(self.frame) - self.frame.size.height/2 + self.frame.size.height/7)
        
        self.addChild(scoreLabel)
        
        //LIFE LABEL
        
       lifeLabel.fontName = "Helvetica"
        lifeLabel.fontSize = 18
        lifeLabel.text = "Vidas: \(life)"
        lifeLabel.zPosition = 100
        lifeLabel.fontColor = UIColor.yellowColor()
        lifeLabel.position = CGPointMake(CGRectGetMidX(self.frame) - self.frame.size.width/7 + 100, CGRectGetMidY(self.frame) - self.frame.size.height/2 + self.frame.size.height/7)
        
        self.addChild(lifeLabel)
     
        
        
        
        //-------- High Score ---------------
        
        //SCORE LABEL
        HighScoreLabel.fontName = "Helvetica"
        HighScoreLabel.fontSize = 18
        HighScoreLabel.text = "Recorde: 0"
        HighScoreLabel.zPosition = 100
        HighScoreLabel.fontColor = UIColor.yellowColor()
        HighScoreLabel.position = CGPointMake(CGRectGetMidX(self.frame) - self.frame.size.width/7 + 185, CGRectGetMidY(self.frame) - self.frame.size.height/2 + self.frame.size.height/7)
        
        self.addChild(HighScoreLabel)
        
       
      
        //---------------HIGH SCORE --------------------
        let highscoreshow = defaults.integerForKey("highscore")
        
        HighScoreLabel.text="Record: \(highscoreshow)"
        
        
        
        
        
    }
    
    
    
    
    
    
    func makeBird(){
        // Add the pause button
        // Put it in the center of the scene
      //  pauseButton.position = CGPoint(x:CGRectGetMidX(self.frame) - 100, y:CGRectGetMidY(self.frame) - 100);
     //   pauseButton.name = "Pause"
       // self.addChild(pauseButton)
        
        if life < 0 {
            life = 3
           lifeLabel.text = "Vidas: \(life)"
            
        }
        
        //FOR THE ANIMATION
        //---- Texture is equal to image
        let birdTexture = SKTexture(imageNamed: "bird1.png")
        //---- Texture is equal to image 2
        let birdTexture2 = SKTexture(imageNamed: "bird2.png")
        //TO repeat the animation forever to jump from one texture to another
        let animation = SKAction.animateWithTextures([birdTexture, birdTexture2], timePerFrame: 0.1)
        let makeBirdFlap = SKAction.repeatActionForever(animation)
        

        bird = SKSpriteNode(texture: birdTexture)
        
        //rotate the bird
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 2)
        // Add gravity to the bird
        bird.physicsBody?.dynamic = true
        
        
        // Give position to the image
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidX(self.frame))
        
        //add the animation
        bird.runAction(makeBirdFlap)
        
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.contactTestBitMask = ColliderType.Object.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
        
        movingObjects.addChild(bird)
        // -----This is how you add a image to the screen
    
    }
    
    func makePipes(){
    
        let gapHeight = bird.size.height * 3
        
        let movementAmount = arc4random() % UInt32(self.frame.size.height / 2)
        
        let pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        
        let movePipes = SKAction.moveByX(-self.frame.size.width * 2, y: 0, duration: NSTimeInterval(self.frame.width / 100))
        
        let removePipes = SKAction.removeFromParent()
        let moveAndRemovePipes = SKAction.sequence([movePipes, removePipes])
        
        
        
        
        
        var pipeTexture = SKTexture(imageNamed: "pi2.png")
        var pipe1 = SKSpriteNode(texture: pipeTexture)
        pipe1.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipeTexture.size().height/2 + gapHeight / 2 + pipeOffset)
        
        pipe1.runAction(moveAndRemovePipes)
        pipe1.physicsBody = SKPhysicsBody(rectangleOfSize: pipeTexture.size())
        
        pipe1.physicsBody?.categoryBitMask = ColliderType.Object.rawValue
        pipe1.physicsBody?.contactTestBitMask = ColliderType.Object.rawValue
        pipe1.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
        pipe1.physicsBody?.dynamic = false
        
        
        movingObjects.addChild(pipe1)
        
        var pipe2Texture = SKTexture(imageNamed: "pi.png")
        var pipe2 = SKSpriteNode(texture: pipe2Texture)
        pipe2.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) - pipe2Texture.size().height/2 - gapHeight / 2 + pipeOffset)
        pipe2.runAction(moveAndRemovePipes)
        pipe2.physicsBody = SKPhysicsBody(rectangleOfSize: pipeTexture.size())
        pipe2.physicsBody?.dynamic = false
        
        
        pipe2.physicsBody?.categoryBitMask = ColliderType.Object.rawValue
        pipe2.physicsBody?.contactTestBitMask = ColliderType.Object.rawValue
        pipe2.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
        

        movingObjects.addChild(pipe2)
        
        var gap = SKNode()
        gap.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipeOffset)
        gap.runAction(moveAndRemovePipes)
        gap.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(pipe1.size.width / 2, gapHeight) )
        gap.physicsBody?.dynamic = false
        gap.physicsBody?.categoryBitMask = ColliderType.Gap.rawValue
        gap.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        gap.physicsBody?.collisionBitMask = ColliderType.Gap.rawValue
        movingObjects.addChild(gap)
    
    }
    
    var isFirstScore = true
    
    func didBeginContact(contact: SKPhysicsContact) {
        // If it collides with the object Gap do not finish the game
        if contact.bodyA.categoryBitMask == ColliderType.Gap.rawValue ||  contact.bodyB.categoryBitMask == ColliderType.Gap.rawValue {
        
             score++
             scoreLabel.text = "Pontos: \(score)"
            
          //--------------- HIGH SCORE --------------------
           
            
            let highscore=defaults.integerForKey("highscore")
            
            if(score>highscore)
            {
                defaults.setInteger(score, forKey: "highscore")
            }
            let highscoreshow = defaults.integerForKey("highscore")
            
            HighScoreLabel.text="Record: \(highscoreshow)"
            print("hhScore reported: \(HighScoreLabel.text)")
            
          //--------------- HIGH SCORE --------------------
            
            
        }else{
            
            if gameOver == false {
                
                //If you still have lifes
                
                
            
                
                gameOver = true
                 //Game Over Label Score
                 gameOverLabelScore.fontName = "Helvetica"
                 gameOverLabelScore.fontSize = 25
                 gameOverLabelScore.text = "Pontuação: \(score)"
                gameOverLabelScore.zPosition = 100
                 gameOverLabelScore.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-30)
                 labelContainer.addChild(gameOverLabelScore)
                
                 self.speed = 0 // set the speed in scene to 0. Everything

                
                
                // LETS take 1 life off
                life = Int(life) - 1
                gameOverLabel.fontName = "Helvetica"
                gameOverLabel.fontSize = 15
                gameOverLabel.zPosition = 100
               
                if life < 0 {
                    gameOverLabel.text = "O jogo terminou. Clique na tela para reiniciar."
                }else{
                    gameOverLabel.text = "Colisão. Clique na tela para continuar."
                }
                gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
                labelContainer.addChild(gameOverLabel)
                if life < 0 {
                
                
                }else{
                    
                    lifeLabel.text = "Vidas: \(life)"
                
                }
                
                
                
                
                //Save the highst score
             

                
            }
        }
        
       
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if gameOver == false {
            
            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            bird.physicsBody?.applyImpulse(CGVectorMake(0, 50)) // To increase the difficult of the game change this value
            
            
            
        } else{
            // IF LIFE IS EQUAL TO 0. THEN WE RESTART THE GAME
            if life < 0{
            score = 0
            life = 3
            lifeLabel.text = "Vidas: \(life)"
            scoreLabel.text = "Pontos: 0"
            bird.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            movingObjects.removeAllChildren()
            makeBackground()
            self.speed = 1
            
            gameOver = false
            makeBird()
            labelContainer.removeAllChildren()
            }else{
            
                scoreLabel.text = "Pontos: \(score)"
                bird.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
                bird.physicsBody?.velocity = CGVectorMake(0, 0)
                movingObjects.removeAllChildren()
                makeBackground()
                self.speed = 1
                
                gameOver = false
                makeBird()
                labelContainer.removeAllChildren()

            }
            
        }
        
         }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
