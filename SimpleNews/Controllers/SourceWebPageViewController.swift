//
//  SourceWebPageViewController.swift
//  SimpleNews
//
//  Created by balaTTV on 05.05.2022.
//

import Foundation
import UIKit
import WebKit

// - MARK: SourceWebPageViewController
final class SourceWebPageViewController: UIViewController {
    
    // - MARK: IBOutlets
    @IBOutlet private weak var webView: WKWebView!
    
    // - MARK: Properties
    var url: URL?
    
    // - MARK: ViewModels
    private var sourceWebPageVM = SourceWebPageViewModel()
    private var spinnerVM = SpinnerViewModel()
    
    // - MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.popViewController(animated: true)
    }

}

// - MARK: Private Methods
private extension SourceWebPageViewController {
    
    func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        if let url = self.url {
            spinnerVM.createSpinnerView(in: self)
            sourceWebPageVM.openWebPage(url, in: webView)
        } else {
            debugPrint("No url to open web page")
        }
    }
    
}

// - MARK: WKNavigationDelegate
extension SourceWebPageViewController: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        debugPrint("Started loading page")
        spinnerVM.removeSpinnerView()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrint("Web page finished loading")
    }
    
}
