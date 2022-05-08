//
//  NewsViewController.swift
//  SimpleNews
//
//  Created by balaTTV on 04.05.2022.
//

import UIKit
import Kingfisher

final class NewsViewController: UIViewController {
    
    // - MARK: IBOutlets
    @IBOutlet private weak var newsFeedTableView: UITableView!
    
    // - MARK: ViewModels
    private var newsVM: NewsViewModel!
    private var spinnerVM = SpinnerViewModel()
    
    // - MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProtocolConformance()
        registerCell()
        setupView()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupView()
    }

}

// - MARK: Private Methods
private extension NewsViewController {
    
    func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        
        self.spinnerVM.createSpinnerView(in: self)
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=latest&from=\(newsVM.thirtyDaysBeforeToday)&sortBy=publishedAt&apiKey=8792a95d44d14244b2e11ea3f3d0ecb4")!
        
        APIService().getArticles(at: url) { articles  in
            if let articles = articles {
                self.newsVM = NewsViewModel(articles: articles)
            }
            
            DispatchQueue.main.async {
                self.newsFeedTableView.reloadData()
                self.spinnerVM.removeSpinnerView()
            }
        }
    }
    
    func setProtocolConformance() {
        newsFeedTableView.dataSource = self
        newsFeedTableView.delegate = self
    }
    
    func registerCell() {
        let nib = UINib.init(nibName: "ArticleCell", bundle: Bundle(for: ArticleCell.self))
        newsFeedTableView.register(nib, forCellReuseIdentifier: "ArticleCell")
    }
        
}

// - MARK: TableView Data Source
extension NewsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.newsVM == nil ? 0 : self.newsVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsVM == nil ? 0 : self.newsVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? ArticleCell else {
            fatalError("ArticleCell not found")
        }
        let article = self.newsVM.articleAtIndex(indexPath.row)
        cell.selectionStyle = .none
        cell.articleImageView.kf.setImage(with: article.imageURL)
        cell.titleLabel.text = article.title
        cell.descriptionLabel?.text = article.articleDescription
        cell.authorLabel?.text = article.author
        cell.publishedDate.text = article.publishedAt
        return cell
    }
    
}

// - MARK: TableView Delegate
extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SourceWebPageViewController") as? SourceWebPageViewController else {
            fatalError("SourceWebPageViewController doesn't exist")
        }
        let article = newsVM.articleAtIndex(indexPath.row)
        vc.url = article.articleUrl
        show(vc, sender: self)
    }
    
}

