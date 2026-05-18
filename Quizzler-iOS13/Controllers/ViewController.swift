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
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
    var quizBrain: QuizBrain = QuizBrain()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateProgressBar()
        questionLabel.text = quizBrain.getFirstQuestionText()
        optionOne.setTitle((quizBrain.getFirstQuestionAnswers())[0], for: .normal)
        optionTwo.setTitle((quizBrain.getFirstQuestionAnswers())[1], for: .normal)
        optionThree.setTitle((quizBrain.getFirstQuestionAnswers())[2], for: .normal)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.isCorrectAnswer(userAnswer)
        /// Update the UI
        updateButtonColor(sender: sender, isCorrect: isCorrect)
        updateProgressBar()
        updateScoreLabel()
        /// Get the next question
        quizBrain.updateQuestionNumber()
        let options = quizBrain.getCurrentQuestionAnswers()
        questionLabel.text = quizBrain.getCurrentQuestionText()
        optionOne.setTitle(options[0], for: .normal)
        optionTwo.setTitle(options[1], for: .normal)
        optionThree.setTitle(options[2], for: .normal)

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

