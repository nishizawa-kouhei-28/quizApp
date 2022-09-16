//
//  SwiftUIView.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

struct SwiftUIView: View {
    @StateObject var viewModel = ContentViewModel()
    // 再作成しない
    var body: some View {
       
        MainView(viewModel: viewModel)
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
