//
//  MainCollectionViewCell.swift
//  AnimeSearch
//
//  Created by Matheus Dionísio on 25/06/24.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    lazy var container: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "90.0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = #colorLiteral(red: 0.7098041177, green: 0.7098038793, blue: 0.7011842132, alpha: 1)
        
        return label
    }()
    
    lazy var episodeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "90.0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = #colorLiteral(red: 0.7098041177, green: 0.7098038793, blue: 0.7011842132, alpha: 1)
        
        return label
    }()
    
    lazy var averageTimeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "90.0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = #colorLiteral(red: 0.7098041177, green: 0.7098038793, blue: 0.7011842132, alpha: 1)
        
        return label
    }()
    
    lazy var similarityLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "90.0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = #colorLiteral(red: 0.7098041177, green: 0.7098038793, blue: 0.7011842132, alpha: 1)
        
        return label
    }()
    
    lazy var animeGifImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "mbcLogo")
        
        return imageView
    }()
    
    func setupLayout() {
        setHierarchy()
        setConstraints()
    }
    
    func setHierarchy() {
        contentView.addSubview(container)
        container.addSubview(titleLabel)
        container.addSubview(episodeLabel)
        container.addSubview(averageTimeLabel)
        container.addSubview(similarityLabel)
        container.addSubview(animeGifImageView)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            
            episodeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            episodeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            
            averageTimeLabel.topAnchor.constraint(equalTo: episodeLabel.bottomAnchor, constant: 5),
            averageTimeLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            
            similarityLabel.topAnchor.constraint(equalTo: averageTimeLabel.bottomAnchor, constant: 5),
            similarityLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            
            animeGifImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            animeGifImageView.leadingAnchor.constraint(equalTo: episodeLabel.trailingAnchor, constant: 50),
            
        ])
    }
}
