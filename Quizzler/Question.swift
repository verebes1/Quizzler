//
//  Question.swift
//  Quizzler
//
//  Created by verebes on 25/08/2017.
//  Copyright (c) 2017 AD Progress. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
