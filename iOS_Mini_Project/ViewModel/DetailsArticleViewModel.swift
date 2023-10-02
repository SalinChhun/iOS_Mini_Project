//
//  DetailsArticleViewModel.swift
//  iOS_Mini_Project
//
//  Created by PVH_002 on 2/10/23.
//

import Foundation

class DetailsMovieViewModel {
    
    var articleId: String
    var articleData: Payload
    var articleImage: URL?
    var articleTitle: String
    var articleDescription: String
    
    init(article: Payload) {
        self.articleData = article
        self.articleId = article.id
        self.articleTitle = article.title
        self.articleDescription = article.description
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}
