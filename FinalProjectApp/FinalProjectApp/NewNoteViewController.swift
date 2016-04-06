//
//  NewNoteViewController.swift
//  FinalProjectApp
//
//  Created by Jordan Phillipps on 04/04/2016.
//  Copyright © 2016 JordanPhillipps. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData





class NewNoteViewController: UIViewController {
    
    
    //setting up recording device
    required init?(coder aDecoder: NSCoder) {
        
        let baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String   //1
        self.audioURL = NSUUID().UUIDString + ".m4a"                     //2
        let pathComponents = [baseString, self.audioURL]                 //3
        let audioNSURL = NSURL.fileURLWithPathComponents(pathComponents)!//4
        let session = AVAudioSession.sharedInstance()                    //5
        
        let recordSettings = [                                           //6
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000.0,
            AVNumberOfChannelsKey: 2 as NSNumber,
            AVEncoderAudioQualityKey: AVAudioQuality.High.rawValue]
        
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord) //7
            self.audioRecorder = try AVAudioRecorder(URL: audioNSURL, settings: recordSettings) //7
        } catch let initError as NSError {
            print("Initialization error: \(initError.localizedDescription)")
        }
        
        self.audioRecorder.meteringEnabled = true                        //8
        self.audioRecorder.prepareToRecord()                             //9
        
        super.init(coder: aDecoder)                                      //10
    }
    
    //variables and outlets
    @IBOutlet var noteTextField: UITextField!
    @IBOutlet var recordOutlet: UIButton!
    
    var audioURL: String
    var audioRecorder: AVAudioRecorder!
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordOutlet.layer.shadowOpacity = 1.0
        recordOutlet.layer.shadowOffset = CGSize(width: 5.0, height: 4.0)
        recordOutlet.layer.shadowRadius = 5.0
        recordOutlet.layer.shadowColor = UIColor.blackColor().CGColor
        
    }
    
    //cancel button
    @IBAction func cancel(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Saves the recording
    @IBAction func save(sender: AnyObject) {
        
        if noteTextField.text != "" {
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let note = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: context) as! Note
        note.name = noteTextField.text!
        note.url = audioURL
        
        do {
            try context.save()
        }catch let saveError as NSError {
            print("Saving error: \(saveError.localizedDescription)")
        }
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //Record function
    
    @IBAction func record(sender: AnyObject) {
        
        let mic = UIImage(named: "pinkbuttonRecord.png") as UIImage!
        recordOutlet.setImage(mic, forState: .Normal)
        
        
        recordOutlet.layer.shadowOpacity = 1.0
        recordOutlet.layer.shadowOffset = CGSize(width: 5.0, height: 4.0)
        recordOutlet.layer.shadowRadius = 5.0
        recordOutlet.layer.shadowColor = UIColor.blackColor().CGColor
        
        if audioRecorder.recording {
            audioRecorder.stop()
            
            let mic = UIImage(named: "whitebuttonNormal.png") as UIImage!
            recordOutlet.setImage(mic, forState: .Normal)
            
        } else {
            let session = AVAudioSession.sharedInstance()
            
            do {
                try session.setActive(true)
                audioRecorder.record()
            } catch let recordError as NSError {
                print("Recording error: \(recordError.localizedDescription)")
            }
        }
        
    }
    
    // function to change the shadow when user touches record
    @IBAction func touchDownRecord(sender: AnyObject) {
        
        audioPlayer = getAudioPlayerFile("startRecordSound", type: "m4a")
        audioPlayer.play()
        
        recordOutlet.layer.shadowOpacity = 0.9
        recordOutlet.layer.shadowOffset = CGSize(width: -2.0, height: -2.0)
        recordOutlet.layer.shadowRadius = 1.0
        recordOutlet.layer.shadowColor = UIColor.blackColor().CGColor
        
    }
    
    // Function that creates an audioplayer and grabs any file path
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
    
    
}