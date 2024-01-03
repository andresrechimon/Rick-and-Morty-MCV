//
//  CharactersListCellView.swift
//  rickmorty_mvc
//
//  Created by Administrador on 01/12/2023.
//

import Foundation
import UIKit
import Kingfisher

class CharacterListCellView: UITableViewCell {
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let characterNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    let characterStatusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let characterSpecieLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(characterImageView)
        addSubview(characterNameLabel)
        addSubview(characterStatusLabel)
        addSubview(characterSpecieLabel)
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalToConstant: 80),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            
            characterStatusLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 8),
            characterStatusLabel.leadingAnchor.constraint(equalTo: characterNameLabel.leadingAnchor),
            
            characterSpecieLabel.topAnchor.constraint(equalTo: characterStatusLabel.bottomAnchor, constant: 8),
            characterSpecieLabel.leadingAnchor.constraint(equalTo: characterNameLabel.leadingAnchor)
        ])
    }
    
    func configure(_ model:CharacterModel){
        self.characterImageView.kf.setImage(with: URL(string: model.image))
        self.characterNameLabel.text = model.name
        self.characterStatusLabel.text = model.status
        self.characterSpecieLabel.text = model.species
    }
}
