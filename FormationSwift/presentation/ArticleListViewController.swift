//
//  ArticleListViewController.swift
//  FormationSwift
//
//  Created by MacBook on 5/27/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let data = Article.testData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TableView
extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleTableViewCell
        cell.bind(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Navigation
extension ArticleListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sid = segue.identifier {
            switch sid {
                
            case "FromArticleListToArticleDetail":
                let articleDetail = segue.destination as! ArticleDetailViewController
                guard let ip = tableView.indexPathForSelectedRow else { break }
                let article = data[ip.row]
                articleDetail.article = article
                
            default:
                break
            }
        }
    }
}
