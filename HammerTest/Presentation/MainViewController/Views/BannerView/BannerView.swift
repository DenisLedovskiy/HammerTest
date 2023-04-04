//
//  BannerView.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

class BannerView: UIView {

    private let bannersArray = [Design.Image.banner1,
                                Design.Image.banner2,
                                Design.Image.banner3]

    private lazy var bannerCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerViewCell.self, forCellWithReuseIdentifier: BannerViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension BannerView {

    private func configureConstraints() {
        addSubview(bannerCollection)
        bannerCollection.snp.makeConstraints { make in
            make.height.equalTo(112)
            make.left.right.equalToSuperview()
        }
    }
}

//MARK: - CollectionView DataSource
extension BannerView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannersArray.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tap banner \(indexPath.row)")
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerViewCell.reuseIdentifier, for: indexPath) as? BannerViewCell else {return UICollectionViewCell()}

        let banner = bannersArray[indexPath.row]
        cell.configure(image: banner!)
        return cell
    }
}




