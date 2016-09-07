//
//  DesbloqueioUIViewController.swift
//  Passarinho Angolano
//
//  Created by Júlio Gabriel Chilela on 9/7/16.
//  Copyright © 2016 Júlio Gabriel Chilela. All rights reserved.
//

import UIKit

class DesbloqueioUIViewController: UIViewController {
     let defaults=NSUserDefaults()
    @IBOutlet weak var provincia: UILabel!
    @IBAction func ir(sender: AnyObject) {
        performSegueWithIdentifier("irParaNiveis", sender: self)
    }
    override func viewDidLoad() {
        
        if defaults.integerForKey("provinciaDesbloqueada") == 2{
        
         provincia.text = "Cuando Cubango"
        }else if defaults.integerForKey("provinciaDesbloqueada") == 3{
        provincia.text = "Huíla"
        
        }else if defaults.integerForKey("provinciaDesbloqueada") == 4{
            provincia.text = "Namibe"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 5{
            provincia.text = "Moxico"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 6{
            provincia.text = "Bié"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 7{
            provincia.text = "Huambo"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 8{
            provincia.text = "Benguela"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 9{
            provincia.text = "Lunda Sul"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 10{
            provincia.text = "Lunda Norte"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 11{
            provincia.text = "Malange"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 12{
            provincia.text = "Cuanza Sul"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 13{
            provincia.text = "Cuanza Norte"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 14{
            provincia.text = "Luanda"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 15{
            provincia.text = "Uíge"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 16{
            provincia.text = "Zaire"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 17{
            provincia.text = "Bengo"
            
        }else if defaults.integerForKey("provinciaDesbloqueada") == 18{
            provincia.text = "Cabinda"
            
        }















       
        
    }
    

}
