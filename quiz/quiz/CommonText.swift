//
//  CommonText.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//
import SwiftUI

// 共通化されたTextView
struct CommonText: View {
    var text: String
    var size: CGFloat
    var body: some View {
        Text(text)
            .font(.custom("HiraginoSans-W6", size: size))
            .foregroundColor(.white)
            .shadow(color: .blue, radius: 2, x: 0, y: 2)
    }
}
