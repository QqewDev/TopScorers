//
// TopScorers
// DetailModuleBuilder.swift
//
// Created by Alexander Kist on 05.12.2023.

import UIKit

class DetailModuleBuilder {
    static func build() -> DetailViewController {
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor, router: router)
        let viewController = DetailViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
