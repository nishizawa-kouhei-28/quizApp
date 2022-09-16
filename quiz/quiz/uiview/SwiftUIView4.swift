//
//  SwiftUIView4.swift
//  quiz
//
//  Created by cmStudent on 2022/09/09.
//

import SwiftUI

struct SwiftUIView4: View {
    @StateObject var viewModel4 = ContentViewModel4()
    // 再作成しない
    var body: some View {
        MainView4(viewModel4: viewModel4)
    }
}

struct SwiftUIView4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView4()
    }
}
