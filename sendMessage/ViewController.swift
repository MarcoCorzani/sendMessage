//
//  ViewController.swift
//  sendMessage
//
//  Created by Marco F.A. Corzani on 15.12.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    
    
    @IBOutlet weak var messageWasSentLabel: UILabel!
    
    @IBOutlet weak var sentButtonLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
    }

    

    @IBAction func sendMessage(sender: AnyObject) {
        var messageVC = MFMessageComposeViewController()
        
        messageVC.body = "Marco, Du bist der Beste!"
        messageVC.recipients = ["00491714720265"]
        messageVC.messageComposeDelegate = self
        
        self.presentViewController(messageVC, animated: false, completion: nil)
    
    }

    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        switch (result.value) {
        case MessageComposeResultCancelled.value:
            println("Nachricht wurde abgebrochen")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultFailed.value:
            println("Nachricht wurde nicht versendet")
            self.dismissViewControllerAnimated(true, completion: nil)
        case MessageComposeResultSent.value:
            
            self.sentButtonLabel.setTitle("Sag' es ihm noch einmal!", forState: .Normal)
            self.messageWasSentLabel.hidden = false
            println("Nachricht wurde verschickt")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        default:
            break
            
       }
    }










}

