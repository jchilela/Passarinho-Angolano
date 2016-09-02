//
//  NiveisViewController.swift
//  Passarinho Angolano
//
//  Created by Júlio Gabriel Chilela on 8/28/16.
//  Copyright © 2016 Júlio Gabriel Chilela. All rights reserved.
//

import UIKit

class NiveisViewController: UIViewController {
    let defaults=NSUserDefaults()
     func nivel(){
        
        performSegueWithIdentifier("nivel", sender: self)
        
    }
    @IBAction func nivelChoosed(sender: AnyObject) {
        
        
        //Verifying which button clicked
        if sender.tag == 1{
            defaults.setInteger(1, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)

        }else if sender.tag == 2{
            defaults.setInteger(2, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 3{
            defaults.setInteger(3, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 4{
            defaults.setInteger(4, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 5{
            defaults.setInteger(5, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 6{
            defaults.setInteger(6, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 7{
            defaults.setInteger(7, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 8{
            defaults.setInteger(8, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 9{
            defaults.setInteger(9, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 10{
            defaults.setInteger(10, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 11{
            defaults.setInteger(11, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 12{
            defaults.setInteger(12, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 13{
            defaults.setInteger(13, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 14{
            defaults.setInteger(14, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 15{
            defaults.setInteger(15, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 16{
            defaults.setInteger(16, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 17{
            defaults.setInteger(17, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }else if sender.tag == 18{
            defaults.setInteger(18, forKey: "level")
            performSegueWithIdentifier("jogar", sender: sender)
        }

        
    }
    
    
    
    @IBOutlet weak var cunene: UIButton!
    @IBOutlet weak var cuandoCubango: UIButton!
    @IBOutlet weak var moxico: UIButton!
    @IBOutlet weak var huila: UIButton!
    @IBOutlet weak var namibe: UIButton!
    @IBOutlet weak var bie: UIButton!
    @IBOutlet weak var huambo: UIButton!
    @IBOutlet weak var benguela: UIButton!
    
    @IBOutlet weak var zaire: UIButton!
    @IBOutlet weak var lundaSul: UIButton!
    @IBOutlet weak var lundaNorte: UIButton!
    @IBOutlet weak var cuanzaSul: UIButton!
    @IBOutlet weak var luanda: UIButton!
    @IBOutlet weak var uige: UIButton!
    @IBOutlet weak var cabinda: UIButton!
    @IBOutlet weak var bengo: UIButton!
    
    @IBOutlet weak var malange: UIButton!
    @IBOutlet weak var cuanzaNorte: UIButton!
    
    
    
    override func viewDidLoad() {
        //Loading the chosen level
       // defaults.setInteger(8, forKey: "level")
        let level = defaults.integerForKey("level")
        
        
      
            cunene.enabled = false
    
            cuandoCubango.enabled = false
            
      
            huila.enabled = false
       
            namibe.enabled = false
    
            moxico.enabled = false
     
            bie.enabled = false
      
            huambo.enabled = false
        
            benguela.enabled = false
       
            lundaSul.enabled = false
       
            lundaNorte.enabled = false
       
            malange.enabled = false
            
       
            cuanzaSul.enabled = false
       
            cuanzaNorte.enabled = false
     
            luanda.enabled = false
    
            uige.enabled = false
      
            zaire.enabled = false
       
            bengo.enabled = false
        
            cabinda.enabled = false
        
        //print(level)
        
        if level >= 1 {
            cunene.enabled = true
        }
        if level >= 2 {
            cuandoCubango.enabled = true
            
        }
        if level >= 3 {
            huila.enabled = true
        }
        if level >= 4 {
            namibe.enabled = true
        }
        if level >= 5 {
            moxico.enabled = true
        }
        if level >= 6 {
            bie.enabled = true
        }
        if level >= 7 {
             huambo.enabled = true
        }
        if level >= 8 {
             benguela.enabled = true
        }
        if level >= 9 {
            lundaSul.enabled = true
        }
        if level >= 10 {
            lundaNorte.enabled = true
        }
        if level >= 11 {
            malange.enabled = true

        }
        if level >= 12 {
            cuanzaSul.enabled = true
        }
        if level >= 13 {
            cuanzaNorte.enabled = true
        }
        if level >= 14 {
            luanda.enabled = true
        }
        if level >= 15 {
            uige.enabled = true
        }
        if level >= 16 {
            zaire.enabled = true
        }
        if level >= 17 {
            bengo.enabled = true
        }
        if level >= 18 {
            cabinda.enabled = true
        }
        
        
        
        
        
    
    }
    
    
    
    
    
    
    
    
    
    
    

}
