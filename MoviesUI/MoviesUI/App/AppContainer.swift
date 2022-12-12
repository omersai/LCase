//
//  AppContainer.swift
//  MoviesUI
//
//  Created by OMER on 7.12.2022.
//

import Foundation
import MoviesApi

let app = AppContainer()

final class AppContainer{
    let router = AppRouter()
    let service = ServiceManager()
}
