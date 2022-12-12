//
//  DetailContract.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import UIKit

protocol DetailPresenterProtocol {
    func load()
}

protocol DetailViewProtocol: class {
    func update(_ presentation: DetailPresentation)
}
