//
//  MainBuilder.swift
//  HammerTest
//
//  Created by Денис Ледовский on 04.04.2023.
//
import UIKit

final class MainModuleBuilder {
    static func build() -> (UIViewController & MainViewInput) {
        let presenter = MainViewPresenter()
        let viewController = MainViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
