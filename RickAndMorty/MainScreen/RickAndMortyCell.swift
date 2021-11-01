//
//  RickAndMortyCell.swift
//  RickAndMorty
//
//  Created by MacLex on 06.06.2021.
//

import UIKit

class RickAndMortyCell: UITableViewCell {
    // MARK: - Properties
    static let reuseID = "cell"
    var model : Hero?

    var myImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return view
    }()

    let roundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    var lableView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var humanRaceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var location: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var planet: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    fileprivate func setupElemetns() {
        backgroundColor = .black
        addSubview(lableView)
        addSubview(myImageView)
        addSubview(roundLabel)
        addSubview(nameLabel)
        addSubview(humanRaceLabel)
        addSubview(location)
        addSubview(planet)

        lableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lableView.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: -15).isActive = true
        lableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true

        myImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        myImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        myImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        myImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        
        roundLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        roundLabel.leftAnchor.constraint(equalTo: lableView.leftAnchor, constant: 20).isActive = true
        roundLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        roundLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
    
        nameLabel.topAnchor.constraint(equalTo: lableView.topAnchor, constant: 5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: lableView.leftAnchor, constant: 25).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: lableView.rightAnchor, constant: 5).isActive = true

        humanRaceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -5).isActive = true
        humanRaceLabel.leftAnchor.constraint(equalTo: roundLabel.rightAnchor, constant: 5).isActive = true
        humanRaceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        humanRaceLabel.rightAnchor.constraint(equalTo: lableView.rightAnchor, constant: 5).isActive = true

        location.topAnchor.constraint(equalTo: humanRaceLabel.bottomAnchor, constant: 10).isActive = true
        location.leftAnchor.constraint(equalTo: lableView.leftAnchor, constant: 25).isActive = true
        location.heightAnchor.constraint(equalToConstant: 25).isActive = true
        location.rightAnchor.constraint(equalTo: lableView.rightAnchor, constant: 5).isActive = true

        planet.topAnchor.constraint(equalTo: location.bottomAnchor, constant: -10).isActive = true
        planet.leftAnchor.constraint(equalTo: lableView.leftAnchor, constant: 25).isActive = true
        planet.heightAnchor.constraint(equalToConstant: 40).isActive = true
        planet.rightAnchor.constraint(equalTo: lableView.rightAnchor, constant: 5).isActive = true

    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElemetns()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setImage(_ image: UIImage?) {
        myImageView.image = image
    }

    public func configureCell() {
        guard let model = model else { return }
        nameLabel.text = model.name
        humanRaceLabel.text = "\(model.status ?? "") - \(model.species ?? "")"
        location.text = "Last known location:"
        planet.text = model.location?.name
        let url = model.image
        NetworkManager.fetchImage(url: model.image ?? "") {[weak self] image in
            if model.image == url {
                self?.myImageView.image = image
            }
        }
    }

    override func prepareForReuse() {
            super.prepareForReuse()    
            myImageView.image = nil
    }
}

        
