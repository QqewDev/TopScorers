//
//  PlayerListViewController.swift
//  Super easy dev
//
//  Created by Александр Кисть on 05.12.2023
//

import UIKit
import SnapKit

protocol PlayerListViewProtocol: AnyObject {
    func showPlayerData(with players: [Response])
}

class PlayerListViewController: UIViewController {
    // MARK: - Public
    var presenter: PlayerListPresenterProtocol?

    private var playerTableView = UITableView()
    private var playersList: [Response] = []


    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter?.viewDidLoad()
    }

    private func setupViews(){
        view.addSubview(playerTableView)

        playerTableView.dataSource = self
        playerTableView.delegate = self

        playerTableView.backgroundColor = .systemBackground

        playerTableView.register(PlayerCell.self, forCellReuseIdentifier: "\(PlayerCell.self)")

        playerTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Private functions
private extension PlayerListViewController {
    func initialize() {
        setupViews()
        view.backgroundColor = .systemBackground
        title = "Top Scorers"
    }
}

extension PlayerListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let selectedPlayer = playersList[indexPath.row]
      presenter?.showPlayerDetail(for: selectedPlayer)
    }
}

extension PlayerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(PlayerCell.self)", for: indexPath) as? PlayerCell else {
            return UITableViewCell()
        }
        let data = playersList[indexPath.row]
        cell.setData(forData: data)
        return cell
    }
}

// MARK: - PlayerListViewProtocol
extension PlayerListViewController: PlayerListViewProtocol {
    func showPlayerData(with players: [Response]) {
        playersList = players
        playerTableView.reloadData()
    }
}
