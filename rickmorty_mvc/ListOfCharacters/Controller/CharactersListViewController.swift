//
//  ViewController.swift
//  rickmorty_mvc
//
//  Created by Administrador on 01/12/2023.
//

import UIKit

class CharactersListViewController: UIViewController {
    
    var mainView:CharactersListView{self.view as! CharactersListView}
    let apiClient = ListOfCharactersApiClient()
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharacterTableViewDelegate?
    
    override func loadView() {
        view = CharactersListView()
        
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)
        tableViewDelegate = ListOfCharacterTableViewDelegate()
        
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            guard let dataSource = self?.tableViewDataSource else{
                return
            }
            let characterModel = dataSource.characters[index]
            let characterDetailVC = CharacterDetailViewController(characterDetailModel: characterModel)
            self?.present(characterDetailVC!, animated: true)
        }
        
        Task {
            let characters = await apiClient.getListOfCharacters()
            print("Characters: \(characters)")
            tableViewDataSource?.set(characters: characters.results)
        }
    }

}

