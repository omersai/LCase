//
//  MainBuilder.swift
//  MoviesUI
//
//  Created by OMER on 7.12.2022.
//

import UIKit

final class MainBuilder{
    static func make() -> MainViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let router = MainRouter(view: view)
        let interactor = MainInteractor(service: app.service)
        let presenter = MainPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
