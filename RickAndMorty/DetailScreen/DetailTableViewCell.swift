//
//  DetailTableViewCell.swift
//  RickAndMorty
//
//  Created by MacLex on 26.06.2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let reuseID = "DetailCell"
    
    let roundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate func setupElemetns() {
        addSubview(title)
        addSubview(roundLabel)
        addSubview(subTitle)
        backgroundColor = .black
        
        title.topAnchor.constraint(equalTo: topAnchor,constant: 8).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor,constant: 16).isActive = true
        title.rightAnchor.constraint(equalTo: rightAnchor,constant: -16).isActive = true
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        roundLabel.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 8).isActive = true
        roundLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 16).isActive = true
        roundLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        roundLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true

        
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 8).isActive = true
        subTitle.leftAnchor.constraint(equalTo: subTitle.rightAnchor,constant: 16).isActive = true
        subTitle.rightAnchor.constraint(equalTo: rightAnchor,constant: -16).isActive = true
        subTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElemetns()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
