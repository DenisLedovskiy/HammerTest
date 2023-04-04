//
//  BannerViewCell.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

class BannerViewCell: UICollectionViewCell {

    private lazy var bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(image: UIImage) {
        bannerImage.image = image
    }
}

extension BannerViewCell {
    private func configureConstraints() {
        contentView.addSubview(bannerImage)
        bannerImage.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.height.equalTo(112)
            make.width.equalTo(300)
        }
    }
}

