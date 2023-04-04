//
//  RequestRouter.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import Foundation
import Alamofire

class RequestFactory {

    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)

    func makePizzaListRequestFatory() -> PizzaListFactory {
        let errorParser = makeErrorParser()
        return PizzaListRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

