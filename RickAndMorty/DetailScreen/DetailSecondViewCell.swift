//
//  SecondDetailViewCell.swift
//  RickAndMorty
//
//  Created by MacLex on 01.08.2021.
//
//

import UIKit

class DetailSecondViewCell: UITableViewCell {
    
    
    static let reuseID = "DetailSecondViewCell"
    
    
    var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let roundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .green
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        return label
    }()
    
    var subTitle: UILabel = {
        let imageView = UILabel()
        imageView.textAlignment = .left
        imageView.textColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var secondStatus: Bool = false
    
    fileprivate func setupElemetns() {
        backgroundColor = .darkGray
        addSubview(title)
        addSubview(roundLabel)
        addSubview(subTitle)
        
        if secondStatus {
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
            title.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
            title.heightAnchor.constraint(equalToConstant: 25).isActive = true
            
            roundLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15).isActive = true
            roundLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
            roundLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
            roundLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
            
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 8).isActive = true
            subTitle.leftAnchor.constraint(equalTo: roundLabel.rightAnchor,constant: 16).isActive = true
            subTitle.rightAnchor.constraint(equalTo: rightAnchor,constant: -16).isActive = true
            subTitle.heightAnchor.constraint(equalToConstant: 25).isActive = true
            
        } else {
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
            title.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
            title.heightAnchor.constraint(equalToConstant: 25).isActive = true
            
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 8).isActive = true
            subTitle.leftAnchor.constraint(equalTo: leftAnchor,constant: 16).isActive = true
            subTitle.rightAnchor.constraint(equalTo: rightAnchor,constant: -16).isActive = true
            subTitle.heightAnchor.constraint(equalToConstant: 25).isActive = true
            subTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElemetns()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
    }
}

