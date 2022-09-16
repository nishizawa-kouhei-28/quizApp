//
//  CompleteView.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

struct CompleteView: View {
    // 監視の必要がない
   
    var viewModel: ContentViewModel

    
    var body: some View {
        VStack {
            // アイコン表示
//            Image(QuizManager.shared.isQuizWon ? "gameClear" :"gameOver")
//                .resizable()
//                .frame(width: 50, height: 50, alignment: .center)
//                .padding()
                
            
            // メッセージ表示
            Group {
                CommonText(text: QuizManager.shared.isQuizWon ?
                             "ゲームクリア！" :
                                "ゲームオーバー",
                             size: 30)
                    .padding()
                
//                CommonText(text: QuizManager.shared.isQuizWon
//                             ? "きみはすごい！"
//                             : "また挑戦してね",
//                             size: 30)
//                    .padding()
            }
            
            if #available(iOS 15.0, *) {
                Button {
                    viewModel.restart()
                } label: {
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .padding()
                        
                        Text("また挑戦する")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    }
                }.frame(width: 300, height: 60, alignment: .center)
                    .background(.purple.opacity(0.7))
                    .cornerRadius(30)
                    .padding()
            } else {
                // Fallback on earlier versions
            }
        }
    }

}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView(viewModel: ContentViewModel())
    }
}
