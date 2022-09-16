//
//  QuizData.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

struct QuizData {
    var question: String
    var answer: String
    var optionsList: [QuizOption]
    
    /// 選択肢
    struct QuizOption : Identifiable {
        // 単なるID
        var id: Int
        // 画面に表示するID
        var optionId: String
        var option: String
        var color: Color
        var isSelected = false
        var isMatched = false
    }
}
