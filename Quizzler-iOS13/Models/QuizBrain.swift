//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Adel Nabil on 17/05/2026.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let questions: [Question] = [
        Question(text: "A slug's blood is green.", answer: "True"),
        Question(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(text: "Google was originally called 'Backrub'.", answer: "True"),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
        
    ]
    
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    
    func getProgress() -> Float {
        return Float(self.currentQuestionIndex + 1) / Float(self.questions.count)
    }
    
    func getFirstQuestionText() -> String {
        return questions[0].text
    }
    
    func getScore() -> Int {
        return score
    }

    mutating func getNextQuestionText() -> String {
        currentQuestionIndex += 1
        currentQuestionIndex %= questions.count
        if(currentQuestionIndex == 0){
            score = 0
        }
        return questions[currentQuestionIndex].text
    }
    
    mutating func isCorrectAnswer(_ userAnswer: String) -> Bool {
        let currentAnswer = questions[currentQuestionIndex].answer
        let isCorrect: Bool = userAnswer == currentAnswer
        if(isCorrect) {
            score += 1
        }
        isCorrect ? print("That's correct!") : print("Not quite.")
        return isCorrect
    }
}
