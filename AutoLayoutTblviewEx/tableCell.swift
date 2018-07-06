//
//  viewControllerCell.swift
//  AutoLayoutTblviewEx
//
//  Created by Atmakury Harish on 5/7/18.
//  Copyright © 2018 Atmakury Harini. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {

    
    lazy var cellLabel1:UILabel = {
        let label:UILabel = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cellLabel2:UILabel = {
        let label:UILabel = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var cellLabel3:UILabel = {
        let label:UILabel = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stack:UIStackView = {
        let stack:UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        
        contentView.addSubview(stack)
        stack.addArrangedSubview(cellLabel1)
//        let spacer1:UIView = UIView()
//        spacer1.translatesAutoresizingMaskIntoConstraints = true
//        spacer1.heightAnchor.constraint(equalToConstant: 20)
//        stack.addArrangedSubview(spacer1)
        stack.addArrangedSubview(cellLabel2)
//        let spacer2:UIView = UIView()
//        spacer2.translatesAutoresizingMaskIntoConstraints = true
//        spacer2.heightAnchor.constraint(equalToConstant: 20)
//        stack.addArrangedSubview(spacer2)
        stack.addArrangedSubview(cellLabel3)
    }
    
    func setupConstraints(){
        stack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
