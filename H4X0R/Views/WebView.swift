//
//  WebView.swift
//  H4X0R
//
//  Created by 孙磊 on 2022/6/6.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    let urlString: String?
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let view = uiView as! WKWebView
        guard let urlString = urlString else {return}
        guard let url = URL(string: urlString) else {return}
        view.load(URLRequest(url: url))
    }
    
    func makeUIView(context: Context) -> some UIView {
        return WKWebView()
    }
}
