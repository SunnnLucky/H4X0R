//
//  NetworkManager.swift
//  H4X0R
//
//  Created by 孙磊 on 2022/6/5.
//

import Foundation

class NetworkManager {
    
    static let algoliaURL : String = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    class func fetchData(successClosures : @escaping (Results)->(),failClosures: @escaping (String)->() ) {
        guard let url = URL(string: algoliaURL) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                failClosures(error.localizedDescription)
            } else {
                guard let safeData = data else { failClosures("data为空"); return }
                let decoder = JSONDecoder()
                do {
                    let decodeData = try decoder.decode(Results.self, from: safeData)
                    DispatchQueue.main.async {
                        successClosures(decodeData)
                    }
                } catch {
                    failClosures(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
//    class func parseJSON(_ data: Data, failClosures: (String)->()) -> Results? {
//        let decoder = JSONDecoder()
//        do {
//            let decodeData = try decoder.decode(Results.self, from: data)
////            let rate = decodeData.rate
////            let postModel = PostData()
//            return decodeData
//        } catch {
//            failClosures(error.localizedDescription)
//            return nil
//        }
//    }
}
