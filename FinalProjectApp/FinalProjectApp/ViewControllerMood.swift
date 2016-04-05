//
//  ViewControllerMood.swift
//  FinalProjectApp
//
//  Created by Jordan Phillipps on 05/04/2016.
//  Copyright © 2016 JordanPhillipps. All rights reserved.
//

import UIKit

class ViewControllerMood: UIViewController {
    
    
    @IBOutlet var labelQ1: UILabel!
    
    @IBOutlet var sliderQ1: UISlider!
    
    
    
    @IBAction func sliderQ1Value(sender: AnyObject) {
        
        let currentValue = Int(sliderQ1.value)
        labelQ1.text = "\(currentValue)"
        
    }
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }

    @IBAction func save(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
