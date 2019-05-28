//
//  ApiProvider.swift
//  FormationSwift
//
//  Created by MacBook on 5/27/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import Foundation
import Moya

enum MyLuckyDay: TargetType {
    
//    var baseURL: URL { return URL(string: "https://catalog.mld-dev.fr/api")! }
    var baseURL: URL { return URL(string: "http://catalog.mld-dev.fr/api")! }
    
    case allNews
    case news(newsId: Int)
    case createNews(params: CreateArticleParams)
    
    var path: String {
        switch self {
        case .allNews: return "/news"
        case .news(let newsId): return "/news/\(newsId)"
        case .createNews: return "/news"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .allNews: fallthrough
        case .news:
            return .get
            
        case .createNews:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .allNews: fallthrough
        case .news:
            return .requestPlain
            
        case let .createNews(params):
            return .requestJSONEncodable(params)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
