//
//  FirstViewController.swift
//  AnimeSearch
//
//  Created by Matheus Dionísio on 18/06/24.
//

import UIKit
import SDWebImage

protocol FirstViewProtocol: AnyObject {
    func showGifImage(from url: URL)
    func startLabelBlinkAnimation()
}

class FirstViewController: UIViewController, FirstViewProtocol {

    var presenter: FirstPresenterProtocol!

    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9254903197, green: 0.9254902005, blue: 0.9254903197, alpha: 1)
        return view
    }()

    lazy var gifImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false // Habilita o uso de constraints programáticas
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    lazy var appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Anime Search"
        label.font = UIFont(name: "Anime Ace 2.0 BB", size: 34)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        label.shadowColor = UIColor.lightGray
        label.shadowOffset = CGSize(width: 1.0, height: 1.0)
        return label
    }()
    
    lazy var continueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Click to continue"
        label.font = UIFont(name: "Helvetica-Bold", size: 24)
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.shadowColor = UIColor.lightGray
        label.shadowOffset = CGSize(width: 1.0, height: 1.0)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = FirstPresenter(view: self)
        
        setupViews()
        presenter?.viewDidLoad()
    }
    
    func setupViews() {
        view.addSubview(container)
        container.addSubview(gifImageView)
        gifImageView.addSubview(appTitleLabel)
        gifImageView.addSubview(continueLabel)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            gifImageView.topAnchor.constraint(equalTo: container.topAnchor),
            gifImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            gifImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            gifImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            appTitleLabel.topAnchor.constraint(equalTo: gifImageView.topAnchor, constant: 300),
            appTitleLabel.leadingAnchor.constraint(equalTo: gifImageView.leadingAnchor, constant: 30),
            
            continueLabel.leadingAnchor.constraint(equalTo: gifImageView.leadingAnchor, constant: 100),
            continueLabel.bottomAnchor.constraint(equalTo: gifImageView.bottomAnchor, constant: -100)
        ])
    }
    
    @objc func imageViewTapped() {
        presenter.imageTapped()
    }
    
    func showGifImage(from url: URL) {
        gifImageView.sd_setImage(with: url, completed: nil)
    }
    
    func startLabelBlinkAnimation() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.autoreverse, .repeat], animations: {
            self.continueLabel.alpha = 0.0
        }, completion: nil)
    }
}


