//
//  ViewController.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    private let presenter: MainViewOutput

    internal var pizzaArray = [PizzaResultElement]() {
        didSet {
            DispatchQueue.main.async {
                self.isSetMenu = true
                self.mainTable.reloadData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isSetMenu = false
                }
            }
        }
    }

    private var isSetMenu = false

    //   MARK: - UI
    private var topConstraint: NSLayoutConstraint?

    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = Design.Color.brandBlack
        label.font = Design.Font.h1
        label.text = "Москва"
        return label
    }()

    private lazy var chevronDown: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = Design.Image.chevronDown
        return imageView
    }()

    private lazy var cityButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()

    private lazy var bannerView: BannerView = {
        let view = BannerView()
        return view
    }()

    private lazy var categoryMenu: CategoryView = {
        let view = CategoryView()
        view.selectDelegate = self
        return view
    }()

    private lazy var backMenuView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = Design.Color.white
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()

    private lazy var mainTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tableView.rowHeight = 180

        tableView.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.reuseIdentifier)
        return tableView
    }()

    lazy var shadowTableView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()

    //   MARK: - Init

    init(presenter: MainViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //   MARK: - Lyfecycle

    override func viewDidLayoutSubviews() {
        self.shadowTableView.applyGradient(withColours: [Design.Color.startShadow, Design.Color.endShadow], gradientOrientation: .vertical)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Design.Color.grayForGradient
        configureConstraints()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        presenter.makePizzaListRequest()
    }
}

//   MARK: - Constraits
extension MainViewController {

    private func configureConstraints() {

        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(60)
        }

        view.addSubview(chevronDown)
        chevronDown.snp.makeConstraints { make in
            make.centerY.equalTo(cityLabel.snp.centerY)
            make.left.equalTo(cityLabel.snp.right).offset(8)
            make.width.equalTo(14)
            make.height.equalTo(8)
        }

        view.addSubview(cityButton)
        cityButton.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.top)
            make.left.equalTo(cityLabel.snp.left)
            make.right.equalTo(chevronDown.snp.right)
            make.bottom.equalTo(cityLabel.snp.bottom)
        }

        view.addSubview(bannerView)
        bannerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(cityButton.snp.bottom).offset(24)
            make.height.equalTo(112)
        }

        view.addSubview(categoryMenu)
        categoryMenu.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(32)
        }

        topConstraint = categoryMenu.topAnchor.constraint(equalTo: cityButton.bottomAnchor, constant: 160)
        topConstraint?.isActive = true

        view.addSubview(backMenuView)
        backMenuView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(categoryMenu.snp.bottom).offset(24)
        }

        backMenuView.addSubview(shadowTableView)
        shadowTableView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(8)
        }

        backMenuView.addSubview(mainTable)
        mainTable.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}

//   MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pizzaArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.reuseIdentifier, for: indexPath) as? MenuTableCell else { return UITableViewCell() }
        if !pizzaArray.isEmpty {
            let product = pizzaArray[indexPath.row]
            cell.configureCell(imageUrl: product.img,
                               title: product.name,
                               description: product.description)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap cell \(indexPath.row)")
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y < 0) && !pizzaArray.isEmpty {
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.5) { [self] in
                topConstraint?.constant = 24
                backMenuView.layer.cornerRadius = 0
                bannerView.alpha = 0
                shadowTableView.isHidden = false
                self.view.layoutIfNeeded()
            }
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if !isSetMenu && !pizzaArray.isEmpty {

            switch indexPath.row {
            case 0...7: categoryMenu.setCategory(index: 0)
            case 9...13: categoryMenu.setCategory(index: 1)
            case 15...19: categoryMenu.setCategory(index: 2)
            case 21...23: categoryMenu.setCategory(index: 3)
            case 26...29: categoryMenu.setCategory(index: 4)
            default: break
            }

            if indexPath.row < 2 {
                self.view.layoutIfNeeded()
                UIView.animate(withDuration: 0.5) { [self] in
                    bannerView.alpha = 1
                    topConstraint?.constant = 160
                    backMenuView.layer.cornerRadius = 20
                    shadowTableView.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
}

//   MARK: - SetMenu
extension MainViewController: SelectMenuProtocol {

    func selectMenu(index: Int) {
        if !pizzaArray.isEmpty {
            isSetMenu = true
            setRow(indexRow: index) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isSetMenu = false
                }
            }
        }
    }

    func setRow(indexRow: Int, completion: (() -> ())? = nil) {
        switch indexRow {
        case 0: mainTable.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
            completion?()
        case 1: mainTable.selectRow(at: IndexPath(row: 9, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
            completion?()
        case 2: mainTable.selectRow(at: IndexPath(row: 15, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
            completion?()
        case 3: mainTable.selectRow(at: IndexPath(row: 21, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
            completion?()
        case 4: mainTable.selectRow(at: IndexPath(row: 26, section: 0), animated: true, scrollPosition: UITableView.ScrollPosition.top)
            completion?()
        default: break
        }
    }
}

//   MARK: - MainViewInput
extension MainViewController: MainViewInput {

    func showError(error: Error) {
        self.setErrorAlert(title: "Ошибка", message: error.localizedDescription)
    }

    func showActivityIndicator(show: Bool) {
        if show {
            self.showSpinner()
        } else {
            self.hideSpinner()
        }
    }
}

