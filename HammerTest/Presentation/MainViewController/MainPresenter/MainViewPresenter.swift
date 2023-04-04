//
//  MainViewPresenter.swift
//  HammerTest
//
//  Created by Денис Ледовский on 04.04.2023.
//

import Foundation
import Alamofire

final class MainViewPresenter {

    weak var viewInput: (UIViewController & MainViewInput)?

    private var requestFactory = RequestFactory()

    private func makeProductListRequest() {
        let pizzaList = requestFactory.makePizzaListRequestFatory()
        pizzaList.getPizzaList {
            response in
            self.viewInput?.showActivityIndicator(show: false)
            switch response.result {
            case .success(let result):
                if !result.isEmpty {
                    self.viewInput?.pizzaArray = result
                }
            case .failure(let error):
                self.viewInput?.showError(error: error)
            }
        }
    }
}

extension MainViewPresenter: MainViewOutput {

    func makePizzaListRequest() {
        self.viewInput?.showActivityIndicator(show: true)
        self.makeProductListRequest()
    }
}
