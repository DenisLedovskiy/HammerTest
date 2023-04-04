//
//  PizzaListRequesr.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import Foundation
import Alamofire

class PizzaListRequest: AbstractRequestFactory {

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = Network.baseUrl

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension PizzaListRequest: PizzaListFactory {

    func getPizzaList(completionHandler: @escaping (Alamofire.AFDataResponse<PizzaResult>) -> Void) {
        guard let url = baseUrl else {return}
        let requestModel = PizzaListStruct(baseUrl: url, encoding: .url, headers: [
            "X-RapidAPI-Key":"003ebd10damshcd2bba661b95ee3p18aac4jsn12b7cf0e517c",
            "X-RapidAPI-Host": "pizza-and-desserts.p.rapidapi.com"
        ])
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension PizzaListRequest {

    struct PizzaListStruct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "/pizzas"
        let encoding: RequestRouterEncoding
        let headers: HTTPHeaders
        var parameters: Parameters? {
            return [ : ]
        }
    }
}
