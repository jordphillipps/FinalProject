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
    
    
    @IBOutlet var noteTextField: UITextField!
    @IBOutlet var recordOutlet: UIButton!
    
    var audioURL: String
    var audioRecorder: AVAudioRecorder!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func save(sender: AnyObject) {
        
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let note = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: context) as! Note
        note.name = noteTextField.text!
        note.url = audioURL
        
        do {
            try context.save()
        }catch let saveError as NSError {
            print("Saving error: \(saveError.localizedDescription)")
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func record(sender: AnyObject) {
        
        if audioRecorder.recording {
            audioRecorder.stop()
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
    
}