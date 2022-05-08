//
//  ArticleCell.swift
//  SimpleNews
//
//  Created by balaTTV on 05.05.2022.
//

import UIKit

// - MARK: ArticleCell
final class ArticleCell: UITableViewCell {
    
    // - MARK: IBOutlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var authorLabel: UILabel?
    @IBOutlet weak var publishedDate: UILabel!
    
    // - MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
