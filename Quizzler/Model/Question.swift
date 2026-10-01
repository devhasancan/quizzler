//
//  Question.swift
//  Quizzler
//
//  Created by Can 🚀 on 22.05.2025.
//

import Foundation

struct Question {
    
    var text: String
    var answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
