//
// TopScorers
// DetailViewController.swift
//
// Created by Alexander Kist on 05.12.2023.
//

import UIKit
import SnapKit

protocol DetailViewProtocol: AnyObject {
    func showPlayerDetail(for viewModel: PlayerDetailViewModel)
}

class DetailViewController: UIViewController {
    // MARK: - Public
    var presenter: DetailPresenterProtocol?

    private lazy var playerPhoto: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()

    private lazy var playerName = CustomLabel(textColor: .label, fontName: UIFont.body())
    private lazy var playerAge =  CustomLabel(textColor: .label, fontName: UIFont.body())
    private lazy var playerBirthDate =  CustomLabel(textColor: .label, fontName: UIFont.body())
    private lazy var playerHeight =  CustomLabel(textColor: .label, fontName: UIFont.body())
    private lazy var playerWeight =  CustomLabel(textColor: .label, fontName: UIFont.body())
    private lazy var playerTotalScore =  CustomLabel(textColor: .label, fontName: UIFont.body())
    private lazy var placeholder = UIImage(systemName: "figure.soccer")


    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .label.withAlphaComponent(0.4)

        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        view.layer.masksToBounds = true

        return view
    }()

    private lazy var favoriteButton: UIButton = {
        let btn = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 40)
        btn.setImage(UIImage(systemName: "heart.fill", withConfiguration: configuration), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tintColor = .gray
        btn.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc private func favButtonTapped(){
        isFavorite.toggle()
        if isFavorite {
            favoriteButton.tintColor = .systemRed
        } else {
            favoriteButton.tintColor = .gray
        }
    }

    private var isFavorite: Bool = false

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containerView.layer.cornerRadius = containerView.frame.size.height / 12
        playerPhoto.layer.cornerRadius = playerPhoto.frame.size.height / 2
    }
}

// MARK: - Private functions
private extension DetailViewController {
    func initialize() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .label
        setBackground()
        setupViews()
    }

    private func setupViews(){
        [playerPhoto, playerName, playerAge, playerBirthDate, playerHeight, playerWeight, playerTotalScore, favoriteButton].forEach { item in
            containerView.addSubview(item)
        }
        view.addSubview(containerView)

        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalToSuperview().multipliedBy(0.5)
        }

        playerPhoto.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(40)
            make.size.equalTo(150)
        }

        playerName.snp.makeConstraints { make in
            make.top.equalTo(playerPhoto.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
        }

        playerAge.snp.makeConstraints { make in
            make.top.equalTo(playerName.snp.bottom).offset(10)
            make.leading.equalTo(playerName.snp.leading)
        }

        playerBirthDate.snp.makeConstraints { make in
            make.top.equalTo(playerAge.snp.bottom).offset(10)
            make.leading.equalTo(playerName.snp.leading)
        }

        playerTotalScore.snp.makeConstraints { make in
            make.top.equalTo(playerBirthDate.snp.bottom).offset(10)
            make.leading.equalTo(playerName.snp.leading)
        }

        playerHeight.snp.makeConstraints { make in
            make.top.equalTo(playerTotalScore.snp.bottom).offset(10)
            make.leading.equalTo(playerName.snp.leading)
        }

        playerWeight.snp.makeConstraints { make in
            make.top.equalTo(playerHeight.snp.bottom).offset(10)
            make.leading.equalTo(playerName.snp.leading)
        }

        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(40)
        }
    }

    private func setBackground(){

        let ball1 = createSoccerBallImage(frame: CGRect(x: view.frame.width-74, y: -28, width: 100, height: 100))
        let ball2 = createSoccerBallImage(frame: CGRect(x: 83, y: 100, width: 67, height: 67))
        let ball3 = createSoccerBallImage(frame: CGRect(x: view.frame.width - 202, y: 216, width: 286,height: 286))
        let ball4 = createSoccerBallImage(frame: CGRect (x: 83, y: view.frame.height - 272, width: 56, height: 56))
        let ball5 = createSoccerBallImage(frame: CGRect(x: view.frame.width - 121, y: view.frame.height - 120, width: 97, height: 97))
        let ball6 = createSoccerBallImage(frame: CGRect (x: 34, y: view.frame.height - 250, width: 80, height: 80))

        [ball1, ball2, ball3, ball4, ball5, ball6].forEach { item in
            view.addSubview(item)
            view.sendSubviewToBack(item)
        }
    }

    private func createSoccerBallImage(frame: CGRect) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "soccerball")
        imageView.frame = frame
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}

// MARK: - DetailViewProtocol
extension DetailViewController: DetailViewProtocol {
    func showPlayerDetail(for viewModel: PlayerDetailViewModel) {
        playerName.text = viewModel.name
        playerAge.text = viewModel.age
        playerBirthDate.text = viewModel.birthDate
        playerHeight.text = viewModel.height
        playerWeight.text = viewModel.weight
        playerTotalScore.text = viewModel.totalScore
        if let url = viewModel.photoURL {
            playerPhoto.af.setImage(withURL: url, placeholderImage: placeholder)
        } else {
            playerPhoto.image = placeholder
        }
    }
}
