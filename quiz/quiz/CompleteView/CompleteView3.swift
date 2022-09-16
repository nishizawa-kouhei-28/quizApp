//
//  SwiftUIView.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//
import SwiftUI

struct CompleteView3: View {
    // 監視の必要がない
   
    var viewModel3: ContentViewModel3

    
    var body: some View {
        VStack {
            // アイコン表示
//            Image(quizmanager3.shared.isQuizWon ? "gameClear" :"gameOver")
//                .resizable()
//                .frame(width: 50, height: 50, alignment: .center)
//                .padding()
                
            
            // メッセージ表示
            Group {
                CommonText(text: quizmanager3.shared.isQuizWon ?
                             "ゲームクリア！" :
                                "ゲームオーバー",
                             size: 30)
                    .padding()
                
//                CommonText(text: quizmanager3.shared.isQuizWon
//                             ? "きみはすごい！"
//                             : "また挑戦してね",
//                             size: 30)
//                    .padding()
            }
            
            if #available(iOS 15.0, *) {
                Button {
                    viewModel3.restart()
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

struct CompleteView3_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView3(viewModel3: ContentViewModel3())
    }
}
