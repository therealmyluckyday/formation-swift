//
//  ArticleListViewController.swift
//  FormationSwift
//
//  Created by MacBook on 5/27/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import UIKit
import Moya
import Result

class ArticleListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var data = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppDelegate.apiProvider.request(.allNews) { [weak self] result in
            self?.parseArticleList(result: result)
        }
    }
    
    private func parseArticleList(result: Result<Response, MoyaError>) {
        switch result {
            
        case let .success(moyaResponse):
            do {
                let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                let articles = (try? filteredResponse.map([Article].self)) ?? []
                data.append(contentsOf: articles)
                tableView.reloadData()
            } catch let error {
                debugPrint(error.localizedDescription)
            }
            
        case let .failure(error):
            debugPrint(error.localizedDescription)
        }
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
