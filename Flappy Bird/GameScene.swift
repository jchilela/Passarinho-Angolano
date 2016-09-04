//
//  GameScene.swift
//  Flappy Bird
//
//  Created by Júlio Gabriel Chilela on 8/13/16.
//  Copyright (c) 2016 Júlio Gabriel Chilela. All rights reserved.
//

import SpriteKit
import UIKit
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    

       //Rewards
   
    var ginguba = SKSpriteNode()
    
    var cafe = SKSpriteNode()
    
    var entreDezeVinte = true // PARA TOCAR O SOM UMA VEZ
    var maiorQueVinte = true // Para tocar o som uma vez
    
     var viewController: UIViewController?
    
    var perdeu =  NSBundle.mainBundle().pathForResource("perdeu", ofType: "mp3")!
    
    var ponto =  NSBundle.mainBundle().pathForResource("ponto", ofType: "mp3")!
    
    
    var irJogando =  NSBundle.mainBundle().pathForResource("irJogando3", ofType: "mp3")!
    
    
 
    
    //var pauseButton = SKSpriteNode(imageNamed: "pause2.jpeg")
    
    //-------- HIGH SCORE ---------
     var HighScoreLabel = SKLabelNode()
     let defaults=NSUserDefaults()
    //---------HIGH SCORE --------
    
    
    var score = 0
    var milhoScore = 0
    
    
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
    
    var movingRewards = SKSpriteNode()
    
    var labelContainer = SKSpriteNode()
    
    enum ColliderType: UInt32 {
        case Bird = 1
        case Object = 2
        case Gap = 4
        case milho = 6
        case ginguba = 8
        case cafe = 10
        
        
        
        // If you have more types give a number doble of two.
    
    }
    
    var gameOver = false
    
    
    
    
    
    func makeBackground()  {
        //Loading the chosen level
        let level = defaults.integerForKey("level")
        
        
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
                //  _ = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("adicionarReward"), userInfo: nil, repeats: true)
                
                
                
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
    
    
    
    var audioPlayerPerdeu = AVAudioPlayer()
    var audioPlayerPonto = AVAudioPlayer()
    var audioPlayerIrJogando = AVAudioPlayer()
    
    
    override func didMoveToView(view: SKView) {
        
        
        do {
            
            
            try audioPlayerPonto = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: ponto))
            
            
            
        } catch {
            
            //Process the error here
            
        }
        
        do {
            
            
            try audioPlayerPerdeu = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: perdeu))
            
            
            
        } catch {
            
            //Process the error here
            
        }
        
        do {
            
            
            try audioPlayerIrJogando = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: irJogando))
            
            
            
        } catch {
            
            //Process the error here
            
        }
        
   
        
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
        self.addChild(movingRewards)
        
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
        
        /*if milhoContacto == true {
        
            bird.position = CGPoint(x: CGRectGetMidX(self.frame) + 140 + self.frame.size.width, y: CGRectGetMidY(self.frame) - 100)
            milhoContacto = false
        }else if milhoContacto == false {*/
        // Give position to the image
        bird.position = CGPoint(x: CGRectGetMidX(self.frame) - 100, y: CGRectGetMidX(self.frame))
        
        //add the animation
        bird.runAction(makeBirdFlap)
        
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.contactTestBitMask = ColliderType.Object.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
        
        movingObjects.addChild(bird)
        // -----This is how you add a image to the screen
        audioPlayerIrJogando.numberOfLoops = -1
        audioPlayerIrJogando.play()
        
    
    }
    
    var milho = SKSpriteNode()
    
    
    
    
    
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
        print("GapHeight---\(gapHeight) pipofset\(pipeOffset)")
        
    
        
        
        
        

        
        var RNumber = randomInt(200,max: 320)
        var RNumber2 = randomInt(100,max: 320)
        print("RNUNber\(RNumber)")
        print("RNUNber2\(RNumber2)")
        
        var milhoTexture = SKTexture(imageNamed: "flappy1.png")
        var milho = SKSpriteNode(texture: milhoTexture)
        milho.position = CGPoint(x: CGRectGetMidX(self.frame) + CGFloat(RNumber) + self.frame.size.width, y: CGRectGetMidY(self.frame) - CGFloat(RNumber2))
  
        milho.runAction(moveAndRemovePipes)
        milho.physicsBody = SKPhysicsBody(rectangleOfSize: milhoTexture.size())
        milho.physicsBody?.dynamic = false
        
        
        milho.physicsBody?.categoryBitMask = ColliderType.milho.rawValue
        milho.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        milho.physicsBody?.collisionBitMask = ColliderType.milho.rawValue
        
        
        movingRewards.addChild(milho)
        
        
        
        
        
        
        
        
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
 
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    
    var isFirstScore = true
   
    
 
    
    
    
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        // Se fizer contacto com o milho 
        
        
        
        
        // If it collides with the object Gap do not finish the game
        if contact.bodyA.categoryBitMask == ColliderType.Gap.rawValue ||  contact.bodyB.categoryBitMask == ColliderType.Gap.rawValue {
        
             score++
             scoreLabel.text = "Pontos: \(score)"
            
           
      
            
            //Play the music reducing the time
            audioPlayerPerdeu.stop()
            audioPlayerIrJogando.stop()
            audioPlayerPonto.play()
            audioPlayerIrJogando.numberOfLoops = -1
            audioPlayerIrJogando.play()
            
            //timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "checkTime", userInfo: nil, repeats: true)

            
            
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
            
                       
            
            
            
        }else if contact.bodyA.categoryBitMask == ColliderType.milho.rawValue ||  contact.bodyB.categoryBitMask == ColliderType.milho.rawValue {
            print("contacto")
           // bird.removeFromParent()
           // milhoContacto = true
           // makeBird()
            
            //AVOID BIRD to Rotate. Put it in the original
            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            bird.physicsBody?.angularVelocity = 0
            bird.zRotation = 0
            //---------------------------------------------
            
            
            milhoScore++
           movingRewards.removeAllChildren()
            print(milhoScore)
            defaults.setInteger(milhoScore, forKey: "milho")
            
            
            
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
                    audioPlayerIrJogando.stop()
                    audioPlayerPonto.stop()
                    audioPlayerPerdeu.play()
                    entreDezeVinte = true
                    maiorQueVinte = true
                }else{
                    gameOverLabel.text = "Colisão. Clique na tela para continuar."
                    //Play the music reducing the time
                    audioPlayerIrJogando.stop()
                    audioPlayerPonto.stop()
                    audioPlayerPerdeu.play()
                    
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
        
        
        //--- I want to change the music all the time that I increase my score
        if score > 10 && score < 20 && entreDezeVinte == true {
            irJogando =  NSBundle.mainBundle().pathForResource("irJogando", ofType: "mp3")!
            do {
                
                
                try audioPlayerIrJogando = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: irJogando))
                
                
                
            } catch {
                
                //Process the error here
                
            }
            
            audioPlayerIrJogando.play()
            entreDezeVinte = false
        }else if score > 20 && maiorQueVinte == true {
            irJogando =  NSBundle.mainBundle().pathForResource("irJogando2", ofType: "mp3")!
            do {
                
                
                try audioPlayerIrJogando = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: irJogando))
                
                
                
            } catch {
                
                //Process the error here
                
            }
            
            audioPlayerIrJogando.play()
            maiorQueVinte = false
        }
     
        
        
        //-----------------------------------
        
        
        
        
        
        
        if gameOver == false {
            
            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            bird.physicsBody?.applyImpulse(CGVectorMake(0, 50)) // To increase the difficult of the game change this value
            
            
            
        } else{
            audioPlayerIrJogando.stop()
            audioPlayerPonto.stop()
            audioPlayerPerdeu.stop()
            audioPlayerIrJogando.currentTime = 0.0
            audioPlayerPonto.currentTime = 0.0
            audioPlayerPerdeu.currentTime = 0.0
          
            
            
            // IF LIFE IS EQUAL TO 0. THEN WE RESTART THE GAME
            if life < 0{
                
                
                
            score = 0
            life = 3
            lifeLabel.text = "Vidas: \(life)"
            scoreLabel.text = "Pontos: 0"
            bird.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            movingObjects.removeAllChildren()
                
            movingRewards.removeAllChildren()
                
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
                movingRewards.removeAllChildren()
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
