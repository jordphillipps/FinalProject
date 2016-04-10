//
//  ViewController6.swift
//  FinalProjectApp
//
//  Created by Jordan Phillipps on 10/04/2016.
//  Copyright © 2016 JordanPhillipps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController6: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            var location = CLLocationCoordinate2DMake(50.16753, -5.09798)
            var annotation = MKPointAnnotation()
            
            var span = MKCoordinateSpanMake(0.002, 0.002)
            var region = MKCoordinateRegion(center: location, span: span)
            
            map.setRegion(region, animated: true)
            
            annotation.coordinate = location
            annotation.title = "Carrick Mind"
            
            map.addAnnotation(annotation)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
