//
//  APICaller.swift
//  iOS_Mini_Project
//
//  Created by PVH_002 on 2/10/23.
//

import Foundation

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (Result<ArticlesModel, NetworkError>) -> Void) {
        let urlString = NetworkConstants.shared.serverAddress + "/articles?page=1&size=5"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completionHandler(.failure(.canNotParseData))
                return
            }
            
            if let data = data {
                do {
                    let resultData = try JSONDecoder().decode(ArticlesModel.self, from: data)
                    completionHandler(.success(resultData))
                } catch {
                    print("Error parsing data: \(error)")
                    completionHandler(.failure(.canNotParseData))
                }
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
