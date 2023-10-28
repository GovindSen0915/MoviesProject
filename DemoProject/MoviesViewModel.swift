//
//  MoviesViewModel.swift
//  DemoProject
//
//  Created by Govind Sen on 28/10/23.
//

import Foundation

final class MoviesViewModel {
    
    var movies: MoviesModel = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchMovies() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchMovies { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let movies):
                self.movies = movies
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    
}


extension MoviesViewModel{
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
