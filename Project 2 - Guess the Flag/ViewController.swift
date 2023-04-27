//
//  ViewController.swift
//  Project 2 - Guess the Flag
//
//  Created by Jared Infantino on 2023-04-23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // MARK: - Button configuration
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.configuration?.contentInsets.bottom = 0
        button1.configuration?.contentInsets.leading = 0
        button1.configuration?.contentInsets.top = 0
        button1.configuration?.contentInsets.trailing = 0
        
        button2.configuration?.contentInsets.bottom = 0
        button2.configuration?.contentInsets.leading = 0
        button2.configuration?.contentInsets.top = 0
        button2.configuration?.contentInsets.trailing = 0
        
        button3.configuration?.contentInsets.bottom = 0
        button3.configuration?.contentInsets.leading = 0
        button3.configuration?.contentInsets.top = 0
        button3.configuration?.contentInsets.trailing = 0
        
        button1.layer.borderColor = UIColor.lightGray.cgColor // we can put the UIcolor directly into the bored because it belongs to a CALayer
        button2.layer.borderColor = UIColor.lightGray.cgColor // we add .cgColor to convert it so it works
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }


    // MARK: - Question
    
    func askQuestion() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
}

