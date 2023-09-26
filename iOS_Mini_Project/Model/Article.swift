//
//  Article.swift
//  iOS_Mini_Project
//
//  Created by PVH_002 on 20/9/23.
//

import Foundation

struct Articles: Codable {
    let message, status: String
    var payload: [Payload]
    let page, size, totalElements, totalPages: Int
}

// MARK: - Payload
struct Payload: Codable {
    let id, title, description: String
    let isPublished: Bool
    let categories: [Category]
    let teacher: Teacher
    let comments: [String]
    let thumbnail: String
    let createdDate, lastModified: String
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let imageURL: String
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
    }
}

// MARK: - Teacher
struct Teacher: Codable {
    let id, username, email: String
    let profile: String
    let telephone: String
    let roles: [String]
}
