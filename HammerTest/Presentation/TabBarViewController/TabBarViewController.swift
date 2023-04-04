//
//  TabBarViewController.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.unselectedItemTintColor = Design.Color.grayTabBar
        self.tabBar.tintColor = Design.Color.basePink
        self.tabBar.backgroundColor = Design.Color.white
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

