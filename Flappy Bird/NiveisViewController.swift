//
//  NiveisViewController.swift
//  Passarinho Angolano
//
//  Created by Júlio Gabriel Chilela on 8/28/16.
//  Copyright © 2016 Júlio Gabriel Chilela. All rights reserved.
//

import UIKit

class NiveisViewController: UIViewController {
    
    @IBAction func nivelChoosed(sender: AnyObject) {
        
        performSegueWithIdentifier("jogar", sender: self)
        
        
    }
    
    
    

}
