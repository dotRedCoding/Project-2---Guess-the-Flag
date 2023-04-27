//
//  ViewController.swift
//  Project 2 - Guess the Flag
//
//  Created by Jared Infantino on 2023-04-23.
//

// Challenges
// 1. play score in nav bar - done
// 2. how many questions have been asked out of 10
// 3. if answer is wrong tell them the correct answer in the alert message

import UIKit

class ViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 1
    var flagSelected = 0
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    
    // MARK: - TITLE PROPERTIES
    lazy var titleStackView: UIStackView = {
            titleLabel.textAlignment = .center
            titleLabel.text = "Title"
            subtitleLabel.textAlignment = .center
            subtitleLabel.text = "Question: 1"
            subtitleLabel.font = .italicSystemFont(ofSize: 12)
            let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
            stackView.axis = .vertical
            return stackView
        }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleStackView
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        scoreLabel.text = "Score: "
        
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
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle() // will shuffle the array around so the order will change
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        titleLabel.text = countries[correctAnswer].uppercased()
        subtitleLabel.text = "Question \(questionsAsked)"
        questionsAsked += 1
    }
    
    // MARK: - Button Tap
    
    // IBOutlet = connecting code to storyboard layout
    // IBAction = making storyboard layouts trigger code
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        flagSelected = sender.tag
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        } else {
            title = "Incorrect!, thats the flag for \(countries[flagSelected].uppercased())"
            score -= 1
        }
        
        scoreLabel.text = "Score: \(score)"
        
        // closure - pop up alert
        let ac = UIAlertController(title: title, message: "Your score is \(score) out of 10", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Continue", style: .default, handler: askQuestion) // add button to the alert, no parenthesis on the ask question
        let action2 = UIAlertAction(title: "Thank you", style: .destructive, handler: askQuestion)
        
        if questionsAsked > 10 {
            ac.addAction(action2)
            questionsAsked = 1
            score = 0
            scoreLabel.text = "Score: \(score)"
        } else {
            ac.addAction(action1)
        }
        
        present(ac, animated: true)
    }
    
}

