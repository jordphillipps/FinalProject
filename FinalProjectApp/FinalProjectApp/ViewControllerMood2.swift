//
//  ViewControllerMood2.swift
//  FinalProjectApp
//
//  Created by Jordan Phillipps on 06/04/2016.
//  Copyright © 2016 JordanPhillipps. All rights reserved.
//


var theScoreTwo = Int()

import UIKit

class ViewControllerMood2: UIViewController {
    
    
    
    @IBOutlet var label1: UILabel!
    
    @IBOutlet var slider1: UISlider!
    
    @IBOutlet var label2: UILabel!
    
    @IBOutlet var slider2: UISlider!
    
    @IBOutlet var label3: UILabel!
    
    @IBOutlet var slider3: UISlider!
    
    @IBOutlet var finalscore: UILabel!
    
    
    
    @IBAction func valuechanged1(sender: AnyObject) {
        
        let currentValue = Int(slider1.value)
        label1.text = "\(currentValue)"
        function()
    }
    
    @IBAction func valuechanged2(sender: AnyObject) {
        
        let currentValue = Int(slider2.value)
        label2.text = "\(currentValue)"
        function()
    }
    
    @IBAction func valuechanged3(sender: AnyObject) {
        
        let currentValue = Int(slider3.value)
        label3.text = "\(currentValue)"
        function()
    }
    

    func function() {
        
        let ScoreTwo = Int(slider1.value + slider2.value + slider3.value)
        
        theScoreTwo = theScore + ScoreTwo
        
        finalscore.text = "\(theScoreTwo)"
        
        
    }
    
    
    @IBAction func save(sender: AnyObject) {
        
        Score.append(finalscore.text!)
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    @IBAction func back(sender: AnyObject) {
        
         self.dismissViewControllerAnimated(true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
