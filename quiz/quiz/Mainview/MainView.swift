//
//  MainView.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: ContentViewModel
    
    var background: some View {
        GeometryReader { geometry in
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                LinearGradient(colors: [.purple.opacity(0.5),
                                        .blue.opacity(0.4),
                                        .white.opacity((0.8))], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                background
                
                if (QuizManager.shared.isQuizCompleted) {
                    CompleteView(viewModel: viewModel)
                } else {
                    
                    VStack {
                        // タイトル
                        CommonText(text: "雑学4択クイズ!\n\(viewModel.maxProgress)秒で全部解けるかな？", size: 30)
                            .padding()
                        
                        // 問題
                        CommonText(text: viewModel.quizData.question, size: 17)
                            .lineLimit(4)
                        
                        Spacer()
                        
                        // プログレスバー
                        ZStack {
                            // 下に表示する円
                            Circle()
                                .stroke(lineWidth: 15)
                                .foregroundColor(.gray)
                                .opacity(0.3)
                            
                            // 動く円(下の円より少し大きくする
                            Circle()
                                .trim(from: 0.0, to: min(CGFloat(viewModel.progress) / CGFloat(viewModel.maxProgress),1.0))
                                .stroke(.orange,
                                        style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            // 開始位置が0度の位置になるので、270度ずらす（上の位置から開始させる）
                                .rotationEffect(Angle(degrees: 270))
                                .animation(Animation.linear(duration: 1.0), value: viewModel.progress)
                            
                            CommonText(text: String(viewModel.progress), size: 30)
                        }.frame(width: 150, height: 150)
                        
                        
                        Spacer()
                        // 選択肢
                        OptionGridView(viewModel: viewModel)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}
