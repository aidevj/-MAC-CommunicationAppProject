//
//  ColorViewController.swift
//  CommunicationApp
//
//  Created by Aiden Melendez on 12/7/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

// Delegate for Color VC
    // passing the color name selected to Start VC as text
protocol ColorDelegate: class {
    func passInformation(color: String)
}

// For Color Selection Screen
class ColorViewController: UIViewController {
 
    weak var delegate: ColorDelegate?
    var startVC: StartViewController!       // Set up to send message back to start VC
    
    // Load functions--------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       startVC = storyboard?.instantiateViewController(identifier: "StartViewController") as! StartViewController // bad
    }
    
    // Action functions------------------
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        delegate?.passInformation(color: "RED")
        
        startVC.receivedColor = "Red selected"
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func blueButtonTapped(_ sender: UIButton) {
        delegate?.passInformation(color: "BLUE")
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        delegate?.passInformation(color: "GREEN")
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        delegate?.passInformation(color: "YELLOW")
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func indigoButtonTapped(_ sender: UIButton) {
        delegate?.passInformation(color: "INDIGO")
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func orangeButtonTapped(_ sender: UIButton) {
        delegate?.passInformation(color: "ORANGE")
        
        dismiss(animated: true, completion: nil)
    }
    
}
