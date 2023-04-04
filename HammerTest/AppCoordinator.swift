//
//  AppCoordinator.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

class AppCoordinator {

    var window: UIWindow?

    func start(_ scene: UIWindowScene) {
        self.window = UIWindow(windowScene: scene)
        self.window?.overrideUserInterfaceStyle = .light
        mainScene()
    }

    func mainScene() {
        let module = configureTabBarController()
        window?.rootViewController = module
        window?.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    func configureTabBarController() -> UITabBarController {
        let tabBarController = BaseTabBarController()
        tabBarController.viewControllers = [createVC(MainModuleBuilder.build(), title: "Меню",
                                                     icon: Design.Image.menuIcon),
                                            createVC(ContactsViewController(), title: "Контакты", icon: Design.Image.addressIcon),
                                            createVC(ProfileViewController(), title: "Профиль", icon: Design.Image.profileIcon),
                                            createVC(CartViewController(), title: "Корзина", icon: Design.Image.cartIcon)]
        return tabBarController
    }

    func createVC(_ vc: UIViewController, title: String, icon: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = icon
        return navigationController
    }
}



