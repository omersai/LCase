//
//  MainRouter.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import UIKit

final class MainRouter: MainRouterProtocol{
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MainRoute) {
        switch route {
        case .detail(let movie):
            let detailView = DetailBuilder.make(with: movie)
            view.show(detailView, sender: nil)
        }
    }
}
