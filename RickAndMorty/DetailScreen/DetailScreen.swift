//
//  link.swift
//  RickAndMorty
//
//  Created by MacLex on 26.06.2021.
//

import UIKit

class DetailScreen: UIViewController {

    var episodes: [Episodes]? = []
    let tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        view.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.reuseID)
        view.register(DetailFirstViewCell.self, forCellReuseIdentifier: DetailFirstViewCell.reuseID)
        view.register(DetailSecondViewCell.self, forCellReuseIdentifier: DetailSecondViewCell.reuseID)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public var index: Int?

    private var model: Hero?

    private var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.fetchHero(index: index ?? 0) {[weak self] model in
            self?.model =  model
            NetworkManager.fetchImage(url: model?.image ?? "") { [weak self] image in
                self?.image = image
                NetworkManager.fetchEpisodes(episodes: self?.massEpisodes(episodes: self?.model?.episode ?? []) ?? "") { [weak self] episodes in
                    self?.episodes = episodes
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }
        }
        

        tableView.delegate = self
        tableView.dataSource = self
        createUI()
    }



    func createUI() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back")
        navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor  = .white
        tableView.backgroundColor = .darkGray
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func createDataSource() ->  [(sections: String ,rows: [(title: String, subTitle: String)])] {
        var array: [(sections: String ,rows: [(title: String, subTitle: String)])] = []
        array.append((sections: "" ,rows: [(title: "", subTitle: "" ),
                                           (title: "Live status:", subTitle: model?.status ?? ""),
                                           (title: "Species and Gender:", subTitle: "\(model?.species ?? "") \(model?.gender ?? "")"),
                                           (title: "Last known Location:", subTitle: model?.location?.name ?? ""),
                                           (title: "First seen in", subTitle: model?.episode?.first ?? "")]))
        let rows = episodes?.compactMap({(title: $0.name ?? "", subTitle: $0.episode ?? "")}) ?? []
        array.append((sections: "Episodes", rows: rows))

        return array
    }

    func massEpisodes(episodes: [String]) -> String {
        var mass: [String] = []
        var resultMass: [String] = []
        for str in episodes {
            mass.append(String(str.reversed()))
        }
        mass.forEach {
            for (index,el) in $0.enumerated() {
                if index < 2 && el != "/" {
                    resultMass.append(String(el))
                }
            }
        }
        return resultMass.joined(separator: ",")
    }
}

extension DetailScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        createDataSource()[section].rows.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return createDataSource().count
    }
    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Episodes:"
        } else {
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 where indexPath.row == 0:
         return 350
        default:
         return 90
            
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 where indexPath.row == 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailFirstViewCell.reuseID, for: indexPath) as! DetailFirstViewCell
            cell.firstImageView.image = image
            cell.title.text = model?.name
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailSecondViewCell.reuseID, for: indexPath) as! DetailSecondViewCell
            cell.title.text = createDataSource()[indexPath.section].rows[indexPath.row].title
            cell.subTitle.text = createDataSource()[indexPath.section].rows[indexPath.row].subTitle
            cell.selectionStyle = .none
            return cell
        }
    }
}
