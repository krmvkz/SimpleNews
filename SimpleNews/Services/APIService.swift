//
//  APIService.swift
//  SimpleNews
//
//  Created by balaTTV on 04.05.2022.
//

import Foundation

// - MARK: APIService
struct APIService {
    
    // - MARK: GET Methods
    func getArticles(at url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                debugPrint(error)
                completion(nil)
            } else if let data = data {
                let news = try! JSONDecoder().decode(News.self, from: data)
                if news.status == "ok" {
                    debugPrint(news.status)
                    completion(news.articles)
                } else {
                    debugPrint(news.message)
                    completion(nil)
                }
            }
            
        }.resume()
    }
    
}
