//
//  ContentView.swift
//  quiz
//
//  Created by cmStudent on 2022/08/26.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        
        NavigationView{
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                LinearGradient(colors: [.purple.opacity(0.5),
                                        .blue.opacity(0.4),
                                        .white.opacity((0.8))], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            
            VStack{
        HStack{
            Button(action:{}){
                NavigationLink(destination:SwiftUIView()){Text("料理")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(width: 140, height: 140)
                    .background(Color("startColor"))
                    .clipShape(Circle())
            }
            }
            
            Button(action:{
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
                
                
            }){
                NavigationLink(destination:SwiftUIView3()){Text("数学")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(width: 140, height: 140)
                    .background(Color("startColor"))
                    .clipShape(Circle())
                }
            }
           
            
            Button(action:{}){
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
