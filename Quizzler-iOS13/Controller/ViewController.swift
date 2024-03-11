//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var questionNumber = 0
    @IBOutlet weak var progressViewBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    let quizBrain = QuizBrain();

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quizBrain.quiz[questionNumber].answer
        if quizBrain.checkAnswer(inputAnswer: userAnswer ?? "", correctAnswer: actualAnswer ) {
            print("correct")
            sender.backgroundColor = UIColor.green
        } else {
            print("wrong")
            sender.backgroundColor = UIColor.red
        }
        if questionNumber + 1 < quizBrain.quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @objc func updateUI() {
        progressViewBar.progress = Float(questionNumber + 1) / Float(quizBrain.quiz.count)
        self.trueButton.backgroundColor = UIColor.clear
        self.falseButton.backgroundColor = UIColor.clear
        questionLabel.text = quizBrain.quiz[questionNumber].text
    }


}

