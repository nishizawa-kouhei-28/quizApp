//
//  quizmanager2.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//
import SwiftUI

/// クイズ管理用のクラス。
/// シングルトンで利用する
class quizmanager2 {
    
    static let shared = quizmanager2()
    
    private init() {}
    
    // 出題しているクイズの番号
    private var currentIndex = 0
    
    // すべて出題したかどうか
    var isQuizEnded: Bool {
        currentIndex >= quizmanager2.quizData.count
    }
    
    var isQuizCompleted = false
    var isQuizWon = false
    
    /// クイズを作成する。作成後にクイズの番号を増やす。
    /// - Returns: 未出題のクイズ
    func makeQuizData() -> QuizData {
        let value = quizmanager2.quizData[currentIndex]
        currentIndex += 1
        return value
    }
    
    
    /// クイズゲームをリセットする
    func quizReset() {
        currentIndex = 0
        isQuizCompleted = false
        isQuizWon = false
    }

}


extension quizmanager2 {
    static private var quizData: [QuizData] {
        [
            QuizData(question: "梵の読みはどれ？", answer: "B", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "かわら", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "そよぎ", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "きく", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "じょう", color: .purple),
                        ]),
            QuizData(question: "小鳥遊の読みは？", answer: "C", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "かねなし", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "こんじょうなし", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "たかなし", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "かたなし", color: .purple),
                        ]),
            QuizData(question: "石神井の読みは？", answer: "C", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "しゃけじい", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "いしがみい", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "しゃくじい", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "せきじんい", color: .purple),
                        ]),
            QuizData(question: "湯湯婆の読みは？", answer: "B", optionsList:
                    [QuizData.QuizOption(id: 13, optionId: "A", option: "ゆばあば", color: .yellow),
                     QuizData.QuizOption(id: 14, optionId: "B", option: "ゆたんぽ", color: .red),
                     QuizData.QuizOption(id: 15, optionId: "C", option: "ゆゆばあ", color: .green),
                     QuizData.QuizOption(id: 16, optionId: "D", option: "ゆううばあ", color: .purple),
                        ]),
        ]
    }
}
