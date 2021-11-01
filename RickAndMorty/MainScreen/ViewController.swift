//
//  ViewController.swift
//  RickAndMorty
//
//  Created by MacLex on 06.06.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView  = UITableView()
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RickAndMortyCell.self, forCellReuseIdentifier: RickAndMortyCell.reuseID)
        return tableView
    }()

    var data: RickAndMorty?
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        tableView.delegate = self
        tableView.dataSource = self
        networkManager.fetchPage { [weak self] result in
            self?.data = result
            self?.tableView.reloadData()
        }
    }

    func createUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true      
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RickAndMortyCell.reuseID, for: indexPath) as! RickAndMortyCell
        cell.model = data?.results?[indexPath.row]
        cell.configureCell()
        cell.layer.cornerRadius = 12
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width / 2.5
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScreen = DetailScreen()
        detailScreen.index = data?.results?[indexPath.row].id
        navigationController?.pushViewController(detailScreen, animated: true)
    }
}

