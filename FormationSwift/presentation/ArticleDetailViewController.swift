//
//  ViewController.swift
//  FormationSwift
//
//  Created by MacBook on 5/21/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import UIKit
import AlamofireImage

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let article = Article.testData().first
        
        setImage(for: article)
        titleLabel.text = article?.title
        subtitleLabel.text = article?.subtitle
        contentLabel.text = article?.content
    }
    
    private func setImage(for article: Article?) {
        let placeholder = UIImage(named: "image_placeholder")!
        
        guard let urlStr = article?.imageUrl else {
            imageView.image = placeholder
            return
        }
        
        guard let url = URL(string: urlStr) else {
            imageView.image = placeholder
            return
        }
        
        imageView.af_setImage(withURL: url, placeholderImage: placeholder)
    }
}

