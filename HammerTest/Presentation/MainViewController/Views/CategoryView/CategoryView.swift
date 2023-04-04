//
//  CategoryView.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

protocol SelectMenuProtocol: AnyObject {
    func selectMenu(index: Int)
}

class CategoryView: UIView {

    private let categoryArray = ["Пицца", "Комбо", "Десерты", "Напитки", "Допы"]
    weak var selectDelegate: SelectMenuProtocol?

    private lazy var menuCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: CategoryViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        let defaultRow = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: defaultRow, animated: false, scrollPosition: [])
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

extension CategoryView {

    private func configureConstraints() {
        addSubview(menuCollection)
        menuCollection.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.left.right.equalToSuperview()
        }
    }
}

//MARK: - CollectionView DataSource

extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectDelegate?.selectMenu(index: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.reuseIdentifier, for: indexPath) as? CategoryViewCell else {return UICollectionViewCell()}

        let title = categoryArray[indexPath.row]
        cell.configure(label: title)
        return cell
    }
}

extension CategoryView {

    func setCategory(index: Int) {
        let element = IndexPath(row: index, section: 0)
        menuCollection.selectItem(at: element, animated: true, scrollPosition: UICollectionView.ScrollPosition.left)
    }
}





