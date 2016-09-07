//
//  RewordsUIViewController.swift
//  Passarinho Angolano
//
//  Created by Júlio Gabriel Chilela on 9/2/16.
//  Copyright © 2016 Júlio Gabriel Chilela. All rights reserved.
//

import UIKit

class RewordsUIViewController: UIViewController {
 let defaults=NSUserDefaults()
    @IBAction func niveis(sender: AnyObject) {
       
        performSegueWithIdentifier("backToLevels", sender: self)
        
        
    }

    @IBOutlet weak var bababu1: UIImageView!
    @IBOutlet weak var bababu2: UIImageView!
    @IBOutlet weak var bababu3: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var somImage: UIButton!
    
    @IBAction func som(sender: AnyObject) {
        
        
                   // Call the nivel segue
        if  defaults.integerForKey("som") == 1 {
                print("Som---------------------- 1")
                somImage.setImage(UIImage(named: "vOf.png"),forState: .Normal)
                defaults.setInteger(0, forKey: "som")
            
                
            }else {
                
                print("Som----------------------0")
                somImage.setImage(UIImage(named: "vOn.png"),forState: .Normal)
                defaults.setInteger(1, forKey: "som")
            
        }

        
    }
    override func viewDidLoad() {
        
        
        if  defaults.integerForKey("som") == 1 {

            somImage.setImage(UIImage(named: "vOn.png"),forState: .Normal)
      
            
            
        }else {
            

            somImage.setImage(UIImage(named: "vOf.png"),forState: .Normal)
         
            
        }

        
        
        //Buscar os rewards apanhados
        let cafe = defaults.integerForKey("cafe")
        
        let milho = defaults.integerForKey("milho")
        
    
        
        let ginguba = defaults.integerForKey("ginguba")
        
        
        
        
        let rainhaGinga = defaults.integerForKey("rainhaGinga")
        let reiMandume = defaults.integerForKey("reiMandume")
        let mutuYaKevela = defaults.integerForKey("mutuYaKevela")
        
        label1.text = "Milhos: \(milho)"
        label2.text = "Gingubas: \(ginguba)"
        label3.text = "Cafés: \(cafe)"
        
        let image = UIImage(named: "milho.png")
        bababu1.image = image
        let ginguba1 = UIImage(named: "ginguba.png")
        bababu2.image = ginguba1
        let cafe1 = UIImage(named: "cafe.png")
        bababu3.image = cafe1

        

        
        
        
    }

    
    
    
}
