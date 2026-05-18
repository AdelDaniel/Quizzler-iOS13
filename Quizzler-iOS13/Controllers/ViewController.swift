//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain: QuizBrain = QuizBrain()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateProgressBar()
        questionLabel.text = quizBrain.getFirstQuestionText()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.isCorrectAnswer(userAnswer)
        /// Update the UI
        updateButtonColor(sender: sender, isCorrect: isCorrect)
        updateProgressBar()
        updateScoreLabel()
        /// Get the next question
        questionLabel.text = quizBrain.getNextQuestionText()
    }
    
    
    func updateButtonColor(sender: UIButton, isCorrect: Bool){
        if (isCorrect) {
            UIView.animate(withDuration: 0.1) {
                sender.backgroundColor = UIColor.green
            }
        }else {
            UIView.animate(withDuration: 0.1) {
                sender.backgroundColor = UIColor.red
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.1) {
                sender.backgroundColor = UIColor.clear
            }
        }
        
    }
    
    func updateProgressBar() {
        self.progressBar.progress = self.quizBrain.getProgress()
    }
    
    func updateScoreLabel() {
        self.scoreLabel.text = "Score: \(self.quizBrain.getScore())"
    }


    
}

