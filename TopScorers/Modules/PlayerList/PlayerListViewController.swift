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
    func showDescriptionView()
    func hideDescriptionView()
    func showActivityIndicator()
    func hideActivityIndicator()
    func showPlayersList()
}

class PlayerListViewController: UIViewController {
    // MARK: - Public
    var presenter: PlayerListPresenterProtocol?
    
    // MARK: - Private
    private var playerTableView = UITableView()
    private let seasonTField = CustomTextField()
    private var playersList: [Response] = []
    private let placeholderView = PlaceholderView(title: "Here will be a look at the top 20 scorers of the season.", subtitle: "To change the list, enter the year you are interested in.")
    private let activityIndicator = UIActivityIndicatorView(style: .large)


    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter?.viewDidLoad()
    }
}

// MARK: - Private functions
private extension PlayerListViewController {
    func initialize() {
        setupViews()
    }

    private func setupTabBar(){
        title = "Top Scorers"
    }

    private func setupViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(playerTableView)
        view.addSubview(seasonTField)

        view.addSubview(placeholderView)
        view.addSubview(activityIndicator)

        placeholderView.alpha = 0
        playerTableView.alpha = 0

        playerTableView.dataSource = self
        playerTableView.delegate = self

        seasonTField.delegate = self

        playerTableView.backgroundColor = .systemBackground

        playerTableView.register(PlayerCell.self, forCellReuseIdentifier: "\(PlayerCell.self)")

        seasonTField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }

        playerTableView.snp.makeConstraints { make in
            make.top.equalTo(seasonTField.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }

        placeholderView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(300).multipliedBy(0.1)
        }

        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDelegate
extension PlayerListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlayer = playersList[indexPath.row]
        presenter?.showPlayerDetail(for: selectedPlayer)
    }
}

//MARK: - UITableViewDataSource
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

//MARK: - UITextFieldDelegate
extension PlayerListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let season = textField.text, season.count == 4 {
            presenter?.seasonEntered(season)
        }
        return true
    }
}

// MARK: - PlayerListViewProtocol
extension PlayerListViewController: PlayerListViewProtocol {
    func showPlayerData(with players: [Response]) {
        playersList = players
        playerTableView.reloadData()
    }

    func hideDescriptionView() {
        self.placeholderView.removeFromSuperview()
    }

    func showPlayersList() {
        UIView.animate(withDuration: 0.5) {
            self.playerTableView.alpha = 1
        }
    }

    func showDescriptionView() {
        UIView.animate(withDuration: 0.5) {
            self.placeholderView.alpha = 1
        }
    }

    func showActivityIndicator() {
        activityIndicator.startAnimating()
    }

    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}
