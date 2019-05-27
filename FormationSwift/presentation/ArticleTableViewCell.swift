//
//  ArticleTableViewCell.swift
//  FormationSwift
//
//  Created by MacBook on 5/27/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import UIKit
import AlamofireImage

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func bind(article: Article) {
        setImage(for: article)
        titleLabel.text = article.title
        subtitleLabel.text = article.subtitle
    }
    
    private func setImage(for article: Article) {
        let placeholder = UIImage(named: "image_placeholder")!
        guard let url = URL(string: article.imageUrl) else {
            thumbnailView.image = placeholder
            return
        }
        thumbnailView.af_setImage(withURL: url, placeholderImage: placeholder)
    }

}
