//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sarp Bozkurt on 10.03.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.rightAnswer = correctAnswer
    }
}
