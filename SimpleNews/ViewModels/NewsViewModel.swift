//
//  NewsViewModel.swift
//  SimpleNews
//
//  Created by balaTTV on 05.05.2022.
//

import Foundation
import UIKit
import Kingfisher

// - MARK: NewsViewModel
struct NewsViewModel {
    
    // - MARK: Propeties
    let articles: [Article]
    
}

// - MARK: NewsViewModel Methods
extension NewsViewModel {
    
    var thirtyDaysBeforeToday: String {
        let today = Date()
        let thirtyDaysBeforeToday = Calendar.current.date(byAdding: .day, value: -30, to: today)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.string(from: thirtyDaysBeforeToday)
        return date
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
    
}


// - MARK: ArticleViewModel
struct ArticleViewModel {
    
    // - MARK: Private Propeties
    private let article: Article
    
    // - MARK: Computable Properties
    var author: String? {
        return self.article.author
    }
    
    var title: String {
        return self.article.title
    }
    
    var articleDescription: String? {
        return self.article.articleDescription
    }
    
    var publishedAt: String? {
        let iso8610DateFormatter = ISO8601DateFormatter()
        iso8610DateFormatter.formatOptions = .withFullDate
        guard let iso8610Date = iso8610DateFormatter.date(from: self.article.publishedAt) else {
            return "Not a date"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: iso8610Date)
    }
    
    var articleUrl: URL? {
        if let url = URL(string: self.article.url) {
            return url
        } else {
            return nil
        }
    }
    
    var imageURL: URL? {
        if let url = self.article.urlToImage {
            return URL(string: url)
        } else {
            return URL(string: "https://via.placeholder.com/150/FFFFFF/000000?text=No+image")
        }
    }
    
}

// - MARK: ArticleViewModel Initialization
extension ArticleViewModel {
    
    init(_ article: Article) {
        self.article = article
    }
    
}
