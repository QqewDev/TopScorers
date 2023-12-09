//
//  PlayerListRouter.swift
//  Super easy dev
//
//  Created by Александр Кисть on 05.12.2023
//

protocol PlayerListRouterProtocol {
    func openDetailView(for viewModel: PlayerDetailViewModel)
}

class PlayerListRouter: PlayerListRouterProtocol {
    
    weak var viewController: PlayerListViewController?

    func openDetailView(for viewModel: PlayerDetailViewModel) {
      let detailVC = DetailModuleBuilder.build()
      detailVC.presenter?.setPlayer(viewModel)

      viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
