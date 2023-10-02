//
//  ArticleTableCellViewModel.swift
//  iOS_Mini_Project
//
//  Created by PVH_002 on 2/10/23.
//

import Foundation

class MovieTableCellViewModel {
    var id: String
    var title: String
    var description: String
    var image: URL?
    
    init(article: Payload) {
        self.id = article.id
        self.title = article.title
        self.description = article.description
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imageCode)")
    }
}
