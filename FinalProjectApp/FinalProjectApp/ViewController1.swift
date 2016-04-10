//
//  ViewController1.swift
//  ParseStarterProject-Swift
//
//  Created by Jordan Phillipps on 31/03/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import QuickLook

class ViewController1: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBAction func viewPDFPressed(sender: AnyObject) {
        
        let viewPDF = QLPreviewController()
        viewPDF.dataSource = self
        
        self.presentViewController(viewPDF, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfPreviewItemsInPreviewController(controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(controller: QLPreviewController, previewItemAtIndex index: Int) -> QLPreviewItem {
        let path = NSBundle.mainBundle().pathForResource("newsletter winter 2015", ofType: "pdf")
        let url = NSURL.fileURLWithPath(path!)
        
        return url
    }

   

}
