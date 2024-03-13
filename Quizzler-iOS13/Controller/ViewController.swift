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
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain();

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(inputAnswer: userAnswer ?? "")
        if userGotItRight {
            print("correct")
            sender.backgroundColor = UIColor.green
        } else {
            print("wrong")
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @objc func updateUI() {
        let answerChoices = quizBrain.getAnswers()
        option1.setTitle(answerChoices[0], for: .normal)
        option2.setTitle(answerChoices[1], for: .normal)
        option3.setTitle(answerChoices[2], for: .normal)
        progressViewBar.progress = quizBrain.getProgress()
        self.option1.backgroundColor = UIColor.clear
        self.option2.backgroundColor = UIColor.clear
        self.option3.backgroundColor = UIColor.clear
        questionLabel.text = quizBrain.getText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }


}

