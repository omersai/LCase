//
//  DetailBuilder.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import UIKit
import struct MoviesApi.Movie

final class DetailBuilder{
    static func make(with movie: Movie) -> DetailViewController{
        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let presenter = DetailPresenter(view: view, movie: movie)
        view.presenter = presenter
        return view
    }
}
