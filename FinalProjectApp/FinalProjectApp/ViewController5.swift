//
//  ViewController5.swift
//  ParseStarterProject-Swift
//
//  Created by Jordan Phillipps on 02/04/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class ViewController5: UIViewController, UITableViewDataSource {
    
    var items: [String] = []

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBAction func addItem(sender: AnyObject) {
        alert()
        
        
        
    }
    @IBOutlet var listTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            listTableView.dataSource = self
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("listitem") as! ItemTableViewCell
        cell.itemLabel.text = items[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return items.count
    }

    
    func alert() {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler{
            (textfield) in
            textfield.placeholder = "Enter your action"
        }
        
        let add = UIAlertAction(title: "Add", style: .Default) {
            (action) in
            let textfield = alert.textFields![0] as! UITextField
            self.items.append(textfield.text!)
            self.listTableView.reloadData()
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) {
            (alert) in
            print("Hi")
            
            
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        items.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
}
