//
//  ErrorParser.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import Foundation

class ErrorParser: AbstractErrorParser {

    func parse(_ result: Error) -> Error {
        return result
    }

    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
