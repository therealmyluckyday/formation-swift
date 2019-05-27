//
//  Article.swift
//  FormationSwift
//
//  Created by MacBook on 5/27/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import Foundation

struct Article {
    
    let id: Int
    let title: String
    let subtitle: String
    let content: String
    let imageUrl: String
    
    static func testData() -> [Article] {
        return [
            Article(id: 1, title: "title1", subtitle: "subtitle1", content: "content1", imageUrl: ""),
            Article(id: 2, title: "title2", subtitle: "subtitle2", content: "content2", imageUrl: "https://cdn.pixabay.com/photo/2016/09/01/10/23/image-1635747_960_720.jpg"),
            Article(id: 3, title: "title3", subtitle: "subtitle3", content: "content3", imageUrl: "https://cdn.pixabay.com/photo/2016/09/01/10/23/image-1635747_960_720.jpg")
        ]
    }
    
}
