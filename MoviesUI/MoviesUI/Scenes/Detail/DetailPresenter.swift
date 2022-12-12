//
//  DetailPresenter.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import Foundation
import struct MoviesApi.Movie

final class DetailPresenter: DetailPresenterProtocol {
    
    unowned var view: DetailViewProtocol
    private let movie: Movie
    
    init(view: DetailViewProtocol, movie: Movie) {
        self.view = view
        self.movie = movie
    }
    
    func load() {
        view.update(DetailPresentation(movie: movie))
    }
}
