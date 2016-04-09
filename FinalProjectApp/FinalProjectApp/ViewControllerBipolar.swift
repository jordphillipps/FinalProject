//
//  ViewControllerBipolar.swift
//  FinalProjectApp
//
//  Created by Jordan Phillipps on 09/04/2016.
//  Copyright © 2016 JordanPhillipps. All rights reserved.
//

import UIKit

class ViewControllerBipolar: UIViewController {

    @IBOutlet var videoView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let youtubeURL = "https://www.youtube.com/embed/cXOImAaAFj8"
        
        videoView.allowsInlineMediaPlayback = true
        
        videoView.loadHTMLString("<iframe width=\"\(videoView.frame.width)\" height=\"\(videoView.frame.height)\" src=\"\(youtubeURL)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)

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
