//
//  PostData.swift
//  H4X0R
//
//  Created by 孙磊 on 2022/6/5.
//

import Foundation

struct Results : Decodable {
    let hits : [Post]
}

struct Post : Decodable , Identifiable {
    var id : String {
        objectID
    }
    let points : Int
    let title : String
    let url : String
    let objectID : String
}
