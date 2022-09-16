//
//  quizmanager3.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//
import SwiftUI

/// クイズ管理用のクラス。
/// シングルトンで利用する
class quizmanager3 : ObservableObject{
    
    static let shared = quizmanager3()
    
    private init() {}
    
    // 出題しているクイズの番号
    private var currentIndex = 0
    
    // すべて出題したかどうか
    var isQuizEnded: Bool {
        currentIndex >= quizmanager3.quizData.count
    }
    
    var isQuizCompleted = false
    var isQuizWon = false
    
    /// クイズを作成する。作成後にクイズの番号を増やす。
    /// - Returns: 未出題のクイズ
    func makeQuizData() -> QuizData {
        let value = quizmanager3.quizData[currentIndex]
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


extension quizmanager3 {
    static private var quizData: [QuizData] {
        [
            QuizData(question: "7 × 8 =?", answer: "B", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "55", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "56", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "57", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "58", color: .purple),
                        ]),
            QuizData(question: "10000 ×100 = ?", answer: "C", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "10000", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "100000", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "1000000", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "10000000", color: .purple),
                        ]),
            QuizData(question: "92 × 12 =?", answer: "C", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "1204", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "1004", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "1104", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "1234", color: .purple),
                        ]),
            QuizData(question: "2(x + 1) = 3x + 4”  x はいくつ？", answer: "B", optionsList:
                    [QuizData.QuizOption(id: 13, optionId: "A", option: "0", color: .yellow),
                     QuizData.QuizOption(id: 14, optionId: "B", option: "−２", color: .red),
                     QuizData.QuizOption(id: 15, optionId: "C", option: "-3", color: .green),
                     QuizData.QuizOption(id: 16, optionId: "D", option: "-13", color: .purple),
                        ]),
        ]
    }
}
