//
//  ContentView.swift
//  H4X0R
//
//  Created by 孙磊 on 2022/6/5.
//

import SwiftUI

struct Post : Identifiable{
    let id: String
    let title : String
}

let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "2", title: "Hola"),
    Post(id: "3", title: "Hi"),
    Post(id: "4", title: "Yo"),
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(posts) { post in
                //Trailing Closures
                Text(post.title)
            }
            .navigationTitle("H4X0R NEWS")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
