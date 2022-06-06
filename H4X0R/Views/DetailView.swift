//
//  DetailView.swift
//  H4X0R
//
//  Created by 孙磊 on 2022/6/6.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url:"https://www.baidu.com/")
    }
}



