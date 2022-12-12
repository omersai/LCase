//
//  MoviePresentation.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import UIKit
import MoviesApi

final class MoviePresentation: NSObject {
    
    let title: String
    let img: String
    let subTitle: String
    
    init(title: String, img: String, subTitle: String) {
        self.title = title
        self.img = img
        self.subTitle = subTitle
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MoviePresentation else { return false }
        return self.title == other.title && self.img == other.img && self.subTitle == other.subTitle
    }
}

extension MoviePresentation {
    convenience init(movie: Movie) {
        self.init(title: movie.originalTitle, img: movie.movieImage, subTitle: movie.overview)
    }
}
