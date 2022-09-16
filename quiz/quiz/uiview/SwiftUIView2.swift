//
//  SwiftUIView2.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//

import SwiftUI

struct SwiftUIView2: View {
    @StateObject var viewModel2 = ContentViewModel2()
    // 再作成しない
    var body: some View {
        MainView2(viewModel2: viewModel2)
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2()
    }
}
