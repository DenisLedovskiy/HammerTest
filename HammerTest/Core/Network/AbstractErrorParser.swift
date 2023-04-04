//
//  AbstractErrorParser.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import Foundation

protocol AbstractErrorParser {

    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
