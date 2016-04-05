//
//  ViewController4.swift
//  ParseStarterProject-Swift
//
//  Created by Jordan Phillipps on 02/04/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

var Score = [String]()



class ViewController4: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            self.tableView.dataSource = self
            self.tableView.delegate = self
            
            if NSUserDefaults.standardUserDefaults().objectForKey("Score") != nil {
                Score = NSUserDefaults.standardUserDefaults().objectForKey("Score") as! [String]
            }
            
            
        }
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Score.count
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel!.text = Score[indexPath.row]
        return cell
        
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
}
