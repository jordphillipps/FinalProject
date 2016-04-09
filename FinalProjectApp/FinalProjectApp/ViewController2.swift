//
//  ViewController2.swift
//  ParseStarterProject-Swift
//
//  Created by Jordan Phillipps on 31/03/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var Picker1: UIPickerView!
    
    var Array = ["Anxiety", "Bipolar Disorder", "Depression" ,"Stress"]
    var PlacementAnswer = 0
    

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        Picker1.delegate = self
        Picker1.dataSource = self
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array[row]
        
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    

    
    @IBAction func Submit(sender: AnyObject) {
        
        if (PlacementAnswer == 0){
            
            self.performSegueWithIdentifier("Anxiety", sender: self)
            
        }
        else if (PlacementAnswer == 1){
            
            self.performSegueWithIdentifier("Bipolar", sender: self)
            
        }
        else if (PlacementAnswer == 2) {
            
            self.performSegueWithIdentifier("Depression", sender: self)
            
        }
        else if (PlacementAnswer == 3) {
            
            self.performSegueWithIdentifier("Stress", sender: self)
            
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        PlacementAnswer = row
        
    }
    
    
    
}
