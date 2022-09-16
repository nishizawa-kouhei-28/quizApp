//
//  QuizManager.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

/// クイズ管理用のクラス。
/// シングルトンで利用する
class QuizManager : ObservableObject{
    
    static let shared = QuizManager()
    
    private init() {}
    
    // 出題しているクイズの番号
    private var currentIndex = 0
    
    // すべて出題したかどうか
    var isQuizEnded: Bool {
        currentIndex >= QuizManager.quizData.count
    }
    
    var isQuizCompleted = false
    var isQuizWon = false
    
    /// クイズを作成する。作成後にクイズの番号を増やす。
    /// - Returns: 未出題のクイズ
    func makeQuizData() -> QuizData {
        let value = QuizManager.quizData[currentIndex]
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


extension QuizManager {
    static private var quizData: [QuizData] {
        [
            QuizData(question: "しゃっくりはある調味料をなめると止まります。\nある調味料とはなんでしょう？", answer: "B", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "お酢", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "砂糖", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "醤油", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "塩", color: .purple),
                        ]),
            QuizData(question: "甘くて美味しい羊羹ですが、羊羹はもともとあるものを煮込んだスープのことでした。\nあるスープとはなんでしょう？", answer: "C", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "牛の血", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "牛乳", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "羊の肉", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "馬の肉", color: .purple),
                        ]),
            QuizData(question: "次の野菜の名前うち1つは日本語ではありません。それはどれでしょうか?", answer: "C", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "シイタケ", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "レンコン", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "オクラ", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "ダイコン", color: .purple),
                        ]),
            QuizData(question: "たい焼きは、元々は鯛の形ではありませんでした。どんな形をしていたでしょうか?", answer: "B", optionsList:
                    [QuizData.QuizOption(id: 13, optionId: "A", option: "ウサギ", color: .yellow),
                     QuizData.QuizOption(id: 14, optionId: "B", option: "カメ", color: .red),
                     QuizData.QuizOption(id: 15, optionId: "C", option: "ヒヨコ", color: .green),
                     QuizData.QuizOption(id: 16, optionId: "D", option: "人形", color: .purple),
                        ]),
        ]
    }
}
