//
//  CompleteView2.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//

import SwiftUI

struct CompleteView2: View {
    // 監視の必要がない
   
    var viewModel2: ContentViewModel2

    
    var body: some View {
        VStack {
            // アイコン表示
            Image(quizmanager2.shared.isQuizWon ? "gameClear" :"gameOver")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .padding()
                
            
            // メッセージ表示
            Group {
                CommonText(text: quizmanager2.shared.isQuizWon ?
                             "ゲームクリア！" :
                                "ゲームオーバー",
                             size: 30)
                    .padding()
                
                CommonText(text: quizmanager2.shared.isQuizWon
                             ? "きみはすごい！"
                             : "また挑戦してね",
                             size: 30)
                    .padding()
            }
            
            if #available(iOS 15.0, *) {
                Button {
                    viewModel2.restart()
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

struct CompleteView2_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView2(viewModel2: ContentViewModel2())
    }
}
