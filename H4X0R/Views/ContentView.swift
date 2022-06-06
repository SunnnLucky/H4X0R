//
//  ContentView.swift
//  H4X0R
//
//  Created by 孙磊 on 2022/6/5.
//

import SwiftUI

//@State var post : [Post]

struct ContentView: View {
    
    /*观测对象修饰器，被ObservedObject修饰的变量只要有变化就会自动更新*/
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                //Trailing Closures
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            // 类似viewDidLoad
            networkManager.fetchData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //            .preferredColorScheme(.dark)
    }
}
