//
// TopScorers
// DetailViewController.swift
//
// Created by Alexander Kist on 05.12.2023.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
}

class DetailViewController: UIViewController {
    // MARK: - Public
    var presenter: DetailPresenterProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: - Private functions
private extension DetailViewController {
    func initialize() {
    }
}

// MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
}