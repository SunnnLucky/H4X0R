//
//  NetworkManager.swift
//  H4X0R
//
//  Created by 孙磊 on 2022/6/5.
//

import Foundation


/*符合ObservableObject协议的类可以使用SwiftUI的@Published属性包装器自动声明对属性的更改，以便使用该对象的所有视图都可以重新调用其body属性，并与数据保持同步。*/
class NetworkManager : ObservableObject {
    
    /*SwiftUI最有用的包装器之一，允许开发者创建出能够被自动观察的对象属性，SwiftUI会自动监视这个属性，一旦该属性发生了改变，会自动修改与该属性绑定的界面。*/
    @Published var posts = [Post]()
    
    let algoliaURL : String = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
//    class func fetchData(successClosures : @escaping (Results)->(),failClosures: @escaping (String)->() ) {
    func fetchData() {
        guard let url = URL(string: algoliaURL) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let safeData = data else { print("data为空"); return }
                let decoder = JSONDecoder()
                do {
                    let decodeData = try decoder.decode(Results.self, from: safeData)
                    DispatchQueue.main.async {
                        self.posts = decodeData.hits
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
