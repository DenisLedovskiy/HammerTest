//
//  PizzaListFactory.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import Foundation
import Alamofire

protocol PizzaListFactory {

    func getPizzaList(completionHandler: @escaping (AFDataResponse<PizzaResult>) -> Void)
}
