//
//  MenuTableCell.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit
import Kingfisher
import SkeletonView

class MenuTableCell: UITableViewCell {

    private lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Design.Color.white
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Design.Color.brandBlack
        label.font = Design.Font.h1SemiBold
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Design.Color.grayDescription
        label.font = Design.Font.h2
        label.numberOfLines = 4
        return label
    }()

    private lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = Design.Color.white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 6
        view.layer.borderColor = Design.Color.basePink.cgColor
        return view
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "от 345 р"
        label.textColor = Design.Color.basePink
        label.font = Design.Font.h2
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.backgroundColor = .clear
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureCell(imageUrl: String, title: String, description: String) {
        if let imgUrl = URL(string: imageUrl) {
            productImage.showAnimatedGradientSkeleton()
            productImage.kf.setImage(with: imgUrl, options: [
                .cacheOriginalImage
            ]) { _ in
                self.productImage.hideSkeleton()
            }
        } else {
            productImage.image = Design.Image.testCellImg
        }
        titleLabel.text = title
        descriptionLabel.text = description
    }
}

extension MenuTableCell {
    private func configureConstraints() {

        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.size.equalTo(132)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(16)
        }

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(productImage.snp.right).offset(32)
            make.top.equalTo(productImage.snp.top)
        }

        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalToSuperview().inset(24)
        }

        contentView.addSubview(borderView)
        borderView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.width.equalTo(88)
            make.height.equalTo(32)
        }

        borderView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.center.equalTo(borderView.snp.center)
        }

        if let lastSubview = self.contentView.subviews.last {
            self.contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 24).isActive = true
        }
    }
}

