//
//  OptionGridView4.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//
import SwiftUI

/// 選択肢を表示する画面
struct OptionGridView4: View {
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 20), count: 2)
    
    var viewModel4: ContentViewModel4
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel4.quizData.optionsList) { quizOption in
                OptionCardView4(quizOption: quizOption)
                    .onTapGesture {
                        viewModel4.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
    }
}


struct OptionCardView4: View {
    var quizOption: QuizData.QuizOption
    var body: some View {
        VStack {
            if quizOption.isMatched && quizOption.isSelected {
                OptionStatusImageView4(imageName: "checkmark")
            } else if !quizOption.isMatched && quizOption.isSelected {
                OptionStatusImageView4(imageName: "xmark")
            } else {
                OptionView(quizOption: quizOption)
            }
        }
        .frame(width: 150, height: 150)
        .background(makeBackgroundColor())
        .cornerRadius(40)
    }
    
    
    /// 選択肢のセルの背景色を取得する
    /// - Returns: 色
    func makeBackgroundColor() -> Color {
        if quizOption.isMatched && quizOption.isSelected {
            return .green
        } else if !quizOption.isMatched && quizOption.isSelected {
            return .red
        } else {
            return .white
        }
    }
}

/// 選択肢を表示するView
struct OptionView4: View {
    var quizOption: QuizData.QuizOption
    var body: some View {
        VStack {
            Text(quizOption.optionId)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .frame(width: 50, height: 50)
                .background(quizOption.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(25)
            
            Text(quizOption.option)
                .frame(width: 150, height: 30)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}

/// 選択肢に表示する✗などの記号のView
struct OptionStatusImageView4: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(.white)
    }
}
