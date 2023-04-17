//
//  MainInteractor.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import Foundation
import MoviesApi

final class MainInteractor: MainInteractorProtocol{
    var delegate: MainInteractorDelegate?
    private let service: ServiceProtocol
    private var movies:  [Movie] = []
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func load(paramaters: String) {
        delegate?.handleOutput(.setLoading(true))
        service.fetchMovies(paramaters: ["query" : paramaters]) { [weak self] (result) in
            guard let self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            
            switch result{
            case .success(let value):
                self.movies = value.results
                self.delegate?.handleOutput(.showMovie(self.movies))
            case .failure(let error):
                print("errors ", error.localizedDescription)
            }
        }
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        delegate?.handleOutput(.showDetail(movie))
    }
}
