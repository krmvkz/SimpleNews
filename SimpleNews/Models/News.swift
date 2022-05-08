//
//  News.swift
//  SimpleNews
//
//  Created by balaTTV on 05.05.2022.
//

import Foundation

// MARK: - News
struct News: Decodable {
    
    // - MARK: Properties
    let status: String
    let code: String?
    let message: String?
    let totalResults: Int?
    let articles: [Article]?
    
}

// MARK: - Article
struct Article: Decodable {
    
    // - MARK: Properties
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?

    // - MARK: Coding Keys
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
}

// MARK: - Source
struct Source: Decodable {
    
    // - MARK: Properties
    let id: String?
    let name: String
    
}

