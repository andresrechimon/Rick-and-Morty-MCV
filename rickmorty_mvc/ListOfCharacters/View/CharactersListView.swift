//
//  CharactersListView.swift
//  rickmorty_mvc
//
//  Created by Administrador on 01/12/2023.
//

import Foundation
import UIKit

class CharactersListView: UIView {
    let charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(charactersTableView)
        
        NSLayoutConstraint.activate([
            charactersTableView.topAnchor.constraint(equalTo: topAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
