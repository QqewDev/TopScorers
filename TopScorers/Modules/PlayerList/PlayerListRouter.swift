//
//  PlayerListRouter.swift
//  Super easy dev
//
//  Created by Александр Кисть on 05.12.2023
//

protocol PlayerListRouterProtocol {
    func openDetailView(for player: Response)
}

class PlayerListRouter: PlayerListRouterProtocol {
    
    weak var viewController: PlayerListViewController?

    func openDetailView(for player: Response) {
      let detailVC = DetailModuleBuilder.build()
      detailVC.presenter?.setPlayer(player)

      viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
