//
//  MainProtocols.swift
//  HammerTest
//
//  Created by Денис Ледовский on 04.04.2023.
//

import Foundation

protocol MainViewInput: AnyObject {
    var pizzaArray: [PizzaResultElement] { get set }
    func showError(error: Error)
    func showActivityIndicator(show: Bool)
}

protocol MainViewOutput: AnyObject {
    func makePizzaListRequest()
}
