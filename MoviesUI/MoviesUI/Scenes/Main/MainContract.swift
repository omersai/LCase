//
//  MainContract.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import Foundation
import struct MoviesApi.Movie

// MARK: Interactor
protocol MainInteractorProtocol: class {
    var delegate: MainInteractorDelegate? { get set }
    func load(paramaters: String)
    func selectMovie(at index: Int)
}

enum MainInteractorOutput{
    case setLoading(Bool)
    case showMovie([Movie])
    case showDetail(Movie)
}

protocol MainInteractorDelegate: class {
    func handleOutput(_ output: MainInteractorOutput)
}

// MARK: Presenter
protocol MainPresenterProtocol: class {
    func load(paramaters: String)
    func selectMovie(at index: Int)
}

enum MainMoviePresenterOutput{
    case setLoading(Bool)
    case showMovie([MoviePresentation])
}


// MARK: View
protocol MainViewProtocol: class {
    func handleOutput(_ output: MainMoviePresenterOutput)
}


// MARK: Router
enum MainRoute{
    case detail(Movie)
}

protocol MainRouterProtocol: class {
    func navigate(to route: MainRoute)
}
