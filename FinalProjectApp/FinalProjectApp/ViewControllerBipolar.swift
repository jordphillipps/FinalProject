//
//  ViewControllerBipolar.swift
//  FinalProjectApp
//
//  Created by Jordan Phillipps on 09/04/2016.
//  Copyright © 2016 JordanPhillipps. All rights reserved.
//

import UIKit

class ViewControllerBipolar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
