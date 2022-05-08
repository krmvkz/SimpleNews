//
//  SourceWebPageViewModel.swift
//  SimpleNews
//
//  Created by balaTTV on 06.05.2022.
//

import Foundation
import WebKit

// - MARK: SourceWebPageViewModel
struct SourceWebPageViewModel {
    
    // - MARK: Methods
    func openWebPage(_ url: URL?, in webView: WKWebView) {
        guard let url = url else {
            fatalError("No URL to open WEB page")
        }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
}

