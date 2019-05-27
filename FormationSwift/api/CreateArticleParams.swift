//
//  CreateArticleParams.swift
//  FormationSwift
//
//  Created by MacBook on 5/27/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import Foundation

struct CreateArticleParams {
    
    let title: String?
    let subtitle: String?
    let content: String?
    
}

extension CreateArticleParams: Encodable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle = "desc_short"
        case content = "desc_long"
    }
    
}
