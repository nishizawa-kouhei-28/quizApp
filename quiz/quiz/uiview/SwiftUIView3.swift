//
//  SwiftUIView3.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//

import SwiftUI

struct SwiftUIView3: View {
    @StateObject var viewModel3 = ContentViewModel3()
    // 再作成しない
    var body: some View {
        MainView3(viewModel3: viewModel3)
    }
}

struct SwiftUIView3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView3()
    }
}
