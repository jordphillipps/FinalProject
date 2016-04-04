//
//  ViewController3.swift
//  ParseStarterProject-Swift
//
//  Created by Jordan Phillipps on 31/03/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData


class ViewController3: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var notesArray: [Note] = []
    
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            tableView.delegate = self
            tableView.dataSource = self
            
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Note")
        self.notesArray = (try! context.executeFetchRequest(request)) as! [Note]
        
        self.tableView.reloadData()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(TableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return notesArray.count
        
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let sound = notesArray[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel!.text = sound.name
        return cell
    }
    
    // A function to create audio player and get any audio file path

    func getAudioPlayerFile(file: String, type: String) -> AVAudioPlayer  {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        var audioPlayer:AVAudioPlayer?
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch let audioPlayerError as NSError {
            print("Failed to initialize player error: \(audioPlayerError.localizedDescription)")
        }
        return audioPlayer!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let sound = notesArray[indexPath.row] //1
        let baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String    //2
        let pathComponents = [baseString, sound.url]                      //3
        let audioNSURL = NSURL.fileURLWithPathComponents(pathComponents)! //4
        let session = AVAudioSession.sharedInstance()   //5
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback) //6
            self.audioPlayer = try AVAudioPlayer(contentsOfURL: audioNSURL) //7
        }  catch let fetchError as NSError {
            print("Fetch error: \(fetchError.localizedDescription)")
        }
        self.audioPlayer.play()  //8
        tableView.deselectRowAtIndexPath(indexPath, animated: true) //9
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
    
    
    
}
