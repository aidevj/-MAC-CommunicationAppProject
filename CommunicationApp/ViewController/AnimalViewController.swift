//
//  AnimalViewController.swift
//  CommunicationApp
//
//  Created by Aiden Melendez on 12/7/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

// For Animal Selection Screen
class AnimalViewController: UIViewController {
    
    // Load functions----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Actions functions-------------------------
    
    @IBAction func dogButtonTapped(_ sender: UIButton) {
        let dogDictionary: [String:Any] = ["image": UIImage(named: "20170319_041947")!, "animal": "DOG" ]
        
          NotificationCenter.default.post(name: Notification.Name("DOG"), object: nil, userInfo: dogDictionary )
          
          dismiss(animated: true, completion: nil)
    } // QN: How to better utilize notifications for multiple information passing?
    
    @IBAction func catButtonTapped(_ sender: UIButton) {
        let catDictionary: [String:Any] = ["image": UIImage(named: "20170319_041947")!, "animal": "CAT" ]
        
          NotificationCenter.default.post(name: Notification.Name("CAT"), object: nil, userInfo: catDictionary )
          
          dismiss(animated: true, completion: nil)
    }
}
