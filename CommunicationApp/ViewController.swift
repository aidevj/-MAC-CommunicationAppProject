//
//  ViewController.swift
//  CommunicationAppProject
//
//  Created by Aiden Melendez on 12/6/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

// For the main screen
class StartViewController: UIViewController {
    
    // Properties--------------------------------
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var animalButton: UIButton!
    @IBOutlet weak var animalLabel: UILabel!    // needs to be hidden until assigned
    @IBOutlet weak var colorLabel: UILabel!     // needs to be hidden until assigned
    @IBOutlet weak var colorButton: UIButton!
    
    var receivedColor: String?
    
    // Load functions----------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStart()
    }
    
    // Action functions----------------------------

    // Tapping Choose Icon Button - opens Icon selection VC "IconViewController"
    @IBAction func chooseIconTapped(_ sender: UIButton) {
        let iconVC = storyboard?.instantiateViewController(identifier: "IconViewController") as! IconViewController
        
        // Send message
        iconVC.outMessage = "Choose Icon tapped from Start VC"
        
        //Assign the icon image to change as the delegate
        iconVC.delegate = self
        
        present(iconVC, animated: true, completion: nil)
    }
    
    // Tapping Choose Color Button - opens Color selection VC "ColorViewController"
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        let colorVC = storyboard?.instantiateViewController(identifier: "ColorViewController") as! ColorViewController
        
        //Assign the icon image to change as the delegate
        colorVC.delegate = self
        
        present(colorVC, animated: true, completion: nil)
    }
    
    // Tapping Clear All - reverts to allow choosing animal and color to be picked again, clearing what is chosen
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        iconImage.image = UIImage(named: "question-mark")
        
        animalButton.isHidden = false
        animalLabel.isHidden = true
        animalLabel.text = "FAV ANIMAL"
        
        colorButton.isHidden = false
        colorLabel.isHidden = true
        colorLabel.text = "FAV COLOR"
        
        print("Cleared all.")
    }
    
    // Note: Other screen transitions done via segue
  
    // Helper functions--------------------------
    
    private func setupStart(){
        animalLabel.isHidden = true
        colorLabel.isHidden = true
        
        // For selecting favorite animal
        
        NotificationCenter.default.addObserver(forName: Notification.Name("DOG"), object: nil, queue: .main) { [weak self] (note) in
            guard let dict = note.userInfo,
                let animal = dict["animal"] as? String else { return }
            
            self?.animalLabel.text = animal
            self?.animalLabel.isHidden = false
            self?.animalButton.isHidden = true
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name("CAT"), object: nil, queue: .main) { [weak self] (note) in
            guard let dict = note.userInfo, // make sure this has a value or otherwise exit scope
                let animal = dict["animal"] as? String else { return }
        
            self?.animalLabel.text = animal
            self?.animalLabel.isHidden = false
            self?.animalButton.isHidden = true
        } // how to make more DRY? i.e. switch/case for Notification name
        //--------END ANIMAL SELECTION
    }
}

// To conform to protocols for delegates
extension StartViewController: IconDelegate {
    func passInformation(image: UIImage) {
        iconImage.image = image
    }
}
extension StartViewController: ColorDelegate {
    func passInformation(color: String) {
        //print("Message from Color VC:\(receivedColor!)")  // error needs to be properly unwrapped
        
        colorLabel.text = color
        colorLabel.isHidden = false
        colorButton.isHidden = true
    }
}
