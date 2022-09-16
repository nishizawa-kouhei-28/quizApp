//
//  quizmanager4.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//

import SwiftUI

/// クイズ管理用のクラス。
/// シングルトンで利用する
class quizmanager4 : ObservableObject{
    
    static let shared = quizmanager4()
    
    private init() {}
    
    // 出題しているクイズの番号
    private var currentIndex = 0
    
    // すべて出題したかどうか
    var isQuizEnded: Bool {
        currentIndex >= quizmanager4.quizData.count
    }
    
    var isQuizCompleted = false
    var isQuizWon = false
    
    /// クイズを作成する。作成後にクイズの番号を増やす。
    /// - Returns: 未出題のクイズ
    func makeQuizData() -> QuizData {
        let value = quizmanager4.quizData[currentIndex]
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


extension quizmanager4 {
    static private var quizData: [QuizData] {
        [
            QuizData(question: "縄文時代のゴミ捨て場の遺跡を、何といいますか？", answer: "B", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "米塚", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "貝塚", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "赤塚", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "青塚", color: .purple),
                        ]),
            QuizData(question: "世界で最も古い木造建築と言われる奈良のお寺の名前は？", answer: "C", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option:  "清水寺", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "金閣寺", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "法隆寺", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "東大寺", color: .purple),
                        ]),
            QuizData(question: "京都の平安京に都が移ったのは西暦何年ですか？", answer: "C", optionsList:
                    [QuizData.QuizOption(id: 1, optionId: "A", option: "774年", color: .yellow),
                     QuizData.QuizOption(id: 2, optionId: "B", option: "795年", color: .red),
                     QuizData.QuizOption(id: 3, optionId: "C", option: "794年", color: .green),
                     QuizData.QuizOption(id: 4, optionId: "D", option: "784年", color: .purple),
                        ]),
            QuizData(question: "織田信長を裏切り本能寺に攻め込み信長を死においやった家来の名前は？", answer: "B", optionsList:
                    [QuizData.QuizOption(id: 13, optionId: "A", option: "羽柴秀吉", color: .yellow),
                     QuizData.QuizOption(id: 14, optionId: "B", option: "明智光秀", color: .red),
                     QuizData.QuizOption(id: 15, optionId: "C", option: "柴田勝家", color: .green),
                     QuizData.QuizOption(id: 16, optionId: "D", option: "お市", color: .purple),
                        ]),
        ]
    }
}
