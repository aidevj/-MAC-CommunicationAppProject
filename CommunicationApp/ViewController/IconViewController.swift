//
//  IconViewController.swift
//  CommunicationApp
//
//  Created by Aiden Melendez on 12/7/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

// Delegate for Icon VC
    // passing the image of icon selected to Start VC
protocol IconDelegate: class {
    func passInformation(image: UIImage)
}

// For Icon Selection Screen
class IconViewController: UIViewController {
    
    // Properties---------------------------
    
    weak var delegate: IconDelegate?
    var outMessage: String!                     // message to receive from Start VC
    
    // Load functions-----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Message from Start VC:\(outMessage!)")
    }
    
    // Action functions---------------------
    
    @IBAction func icon0Tapped(_ sender: UIButton) {
        delegate?.passInformation(image: #imageLiteral(resourceName: "icon0_happy"))
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func icon1Tapped(_ sender: UIButton) {
        delegate?.passInformation(image: #imageLiteral(resourceName: "icon1_lemon"))
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func icon2Tapped(_ sender: UIButton) {
        delegate?.passInformation(image: #imageLiteral(resourceName: "icon3_ghost"))
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
