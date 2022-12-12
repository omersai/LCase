//
//  DetailPresentation.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import UIKit
import MoviesApi

struct DetailPresentation: Equatable {
    
    let title: String
    let img: String
    let subTitle: String
    let imdbPoint: Double
    let dateText: String
}

extension DetailPresentation{
    init(movie: Movie) {
        self.init(title: movie.title,
                  img: movie.movieImage,
                  subTitle: movie.overview,
                  imdbPoint: movie.voteAverage,
                  dateText:movie.releaseDate)
    }
}
