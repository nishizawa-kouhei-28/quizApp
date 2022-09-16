//
//  ContentView.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuizManager.shared
    @ObservedObject var viewModel2 = quizmanager2.shared
    @ObservedObject var viewModel3 = quizmanager3.shared
    @ObservedObject var viewModel4 = quizmanager4.shared
    var body: some View {
        
        NavigationView{
            ZStack {
//                Image("background")
//                    .resizable()
//                    .scaledToFill()
//                    .ignoresSafeArea()
                
//                LinearGradient(colors: [.pink.opacity(0.5),
//                                        .pink.opacity(0.4),
//                                        .white.opacity((0.8))], startPoint: .top, endPoint: .bottom)
//                    .ignoresSafeArea()
            
            VStack{
        HStack{
            Button(action:{
                viewModel.quizReset()
            }){
                NavigationLink(destination:SwiftUIView()){Text("料理")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(width: 140, height: 140)
                    .background(Color("startColor"))
                    .clipShape(Circle())
            }
            }
            
            Button(action:{
                viewModel2.quizReset()
            }){
                NavigationLink(destination:SwiftUIView2()){Text("漢字の読み")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(width: 140, height: 140)
                    .background(Color("startColor"))
                    .clipShape(Circle())
                
            }
            
            
        }
        }
        HStack{
            Button(action:{
                viewModel3.quizReset()
                
            }){
                NavigationLink(destination:SwiftUIView3()){Text("数学")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(width: 140, height: 140)
                    .background(Color("startColor"))
                    .clipShape(Circle())
                }
            }
           
            
            Button(action:{
                viewModel4.quizReset()
            }){
                NavigationLink(destination:SwiftUIView4()){Text("歴史")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(width: 140, height: 140)
                    .background(Color("startColor"))
                    .clipShape(Circle())
                
            }
        }
          
        }
            }
        .navigationTitle("モード選択")
        }
        }
     
        }
        
    }
        
    
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

}
}
