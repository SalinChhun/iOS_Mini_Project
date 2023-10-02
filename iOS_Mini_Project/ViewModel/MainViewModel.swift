//
//  MainViewModel.swift
//  iOS_Mini_Project
//
//  Created by PVH_002 on 2/10/23.
//

import Foundation

class MainViewModel {
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: ArticlesModel?
    var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.payload.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let trendingMovieData):
                self?.dataSource = trendingMovieData
                self?.mapMovieData()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func mapMovieData() {
        movies.value = self.dataSource?.payload.compactMap({MovieTableCellViewModel(article: $0)})
    }
    
    func getMovieTitle(_ article: Payload) -> String {
        return article.title
    }
    
    func retriveMovie(withId id: String) -> Payload? {
        guard let movie = dataSource?.payload.first(where: {$0.id == id}) else {
            return nil
        }
        
        return movie
    }
}
