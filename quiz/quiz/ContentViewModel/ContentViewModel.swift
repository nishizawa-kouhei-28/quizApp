//
//  ContentViewModel.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    // クイズデータはViewで監視して自動的に再表示する
    @Published var quizData = QuizManager.shared.makeQuizData()
    
    // プログレスの秒数は画面上で変化する
    @Published var progress = 0
    var maxProgress = 15
    var timer = Timer()
    
    // 起動と同時にクイズは開始する
    init() {
        start()
    }
    
    
    // 回答を確認する
    func verifyAnswer(selectedOption: QuizData.QuizOption) {
        // 回答チェック前にすべての選択肢を通常表示にする
        for index in quizData.optionsList.indices {
            quizData.optionsList[index].isMatched = false
            quizData.optionsList[index].isSelected = false
        }
        
        // すべての選択肢リストから、選択した記号と一致する最初の記号の場所がindex
        if let index = quizData.optionsList.firstIndex(where: { $0.optionId == selectedOption.optionId }) {
            // 選択した回答が正解ならば、0.5秒後次の問題に進むか、ゲーム終了にする
            if selectedOption.optionId ==  quizData.answer {
                quizData.optionsList[index].isMatched = true
                quizData.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if QuizManager.shared.isQuizEnded {
                        QuizManager.shared.isQuizCompleted = true
                        QuizManager.shared.isQuizWon = true
                        
                        self.reset()
                        
                    } else {
                        self.quizData = QuizManager.shared.makeQuizData()
                        
                    }
                }
            } else {
                quizData.optionsList[index].isMatched = false
                quizData.optionsList[index].isSelected = true
            }
            
        }
    }
    
    /// ゲームを開始する
    func start() {
        // 1秒ごとに動くタイマーを作る
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true) { time in
            if self.progress == self.maxProgress {
                QuizManager.shared.isQuizCompleted = true
                QuizManager.shared.isQuizWon = false
                self.reset()
            } else {
                self.progress += 1
            }
        }
    }
    
    /// ゲームをリセットする
    func reset() {
        timer.invalidate()
        self.progress = 0
    }
    
    /// ゲームをもう一度行う
    func restart() {
        QuizManager.shared.quizReset()
        quizData = QuizManager.shared.makeQuizData()
        self.start()
    }
    
}
