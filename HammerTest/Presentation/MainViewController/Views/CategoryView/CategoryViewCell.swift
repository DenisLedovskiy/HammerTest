//
//  CategoryViewCell.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {

    private lazy var borderView: UIView = {
        let view = UIView()
        view.layer.borderColor = Design.Color.basePinkAlpha40.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 16
        return view
    }()

    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 16
        return view
    }()

    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = Design.Font.h2
        label.textColor = Design.Color.basePinkAlpha40
        return label
    }()

    override var isSelected: Bool {
        didSet {
            backView.backgroundColor = isSelected ? Design.Color.basePinkAlpha20 : .clear
            titleLabel.textColor = isSelected ? Design.Color.basePink : Design.Color.basePinkAlpha40
            titleLabel.font = isSelected ? Design.Font.h2Bold : Design.Font.h2
            borderView.isHidden = isSelected
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        backgroundColor = .clear

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(label: String) {
        titleLabel.text = label
    }
}

extension CategoryViewCell {
    private func configureConstraints() {

        contentView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(88)
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().inset(16)
        }
        contentView.addSubview(borderView)
        borderView.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(88)
            make.center.equalTo(backView.snp.center)
        }

        backView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalTo(backView.snp.center)
        }
    }
}

