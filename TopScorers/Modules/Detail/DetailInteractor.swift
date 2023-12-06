//
// TopScorers
// DetailInteractor.swift
//
// Created by Alexander Kist on 05.12.2023.
//

protocol DetailInteractorProtocol: AnyObject {
}

class DetailInteractor: DetailInteractorProtocol {
    weak var presenter: DetailPresenterProtocol?
}
