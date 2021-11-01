//
//  DetailFirstViewCell.swift
//  RickAndMorty
//
//  Created by MacLex on 01.08.2021.
//

import UIKit

class DetailFirstViewCell: UITableViewCell {


    static let reuseID = "DetailFirstViewCell"


    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    fileprivate func setupElemetns() {
        contentView.addSubview(firstImageView)
        contentView.addSubview(title)
        contentView.backgroundColor = .darkGray

        firstImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        firstImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        firstImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        firstImageView.heightAnchor.constraint(equalToConstant: 280).isActive = true

        title.topAnchor.constraint(equalTo: firstImageView.bottomAnchor,constant: 20).isActive = true
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 16).isActive = true
        title.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -16).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
