//
//  PlayerListModuleBuilder.swift
//  Super easy dev
//
//  Created by Александр Кисть on 05.12.2023
//

import UIKit

class PlayerListModuleBuilder {
    static func build() -> UINavigationController {
        let apiManager = APIManager()
        let interactor = PlayerListInteractor(apiManager: apiManager)
        let router = PlayerListRouter()
        let presenter = PlayerListPresenter(interactor: interactor, router: router)
        let viewController = PlayerListViewController()
        let navController = UINavigationController(rootViewController: viewController)
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return navController
    }
}
