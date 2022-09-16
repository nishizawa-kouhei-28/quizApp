//
//  OptionGridView3.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//
import SwiftUI

/// 選択肢を表示する画面
struct OptionGridView3: View {
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 20), count: 2)
    
    var viewModel3: ContentViewModel3
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel3.quizData.optionsList) { quizOption in
                OptionCardView3(quizOption: quizOption)
                    .onTapGesture {
                        viewModel3.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
    }
}


struct OptionCardView3: View {
    var quizOption: QuizData.QuizOption
    var body: some View {
        VStack {
            if quizOption.isMatched && quizOption.isSelected {
                OptionStatusImageView3(imageName: "checkmark")
            } else if !quizOption.isMatched && quizOption.isSelected {
                OptionStatusImageView3(imageName: "xmark")
            } else {
                OptionView3(quizOption: quizOption)
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
struct OptionView3: View {
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
struct OptionStatusImageView3: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(.white)
    }
}
