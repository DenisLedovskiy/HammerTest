//
//  PizzaResult.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import Foundation

typealias PizzaResult = [PizzaResultElement]

// MARK: - PizzaResultElement
struct PizzaResultElement: Codable {
    let id: Int
    let name: String
    let veg: Bool
    let price: Int
    let description: String
    let quantity: Int
    let img: String
    let sizeandcrust: [Sizeandcrust]
}

// MARK: - Sizeandcrust
struct Sizeandcrust: Codable {
    let mediumPan, mediumstuffedcrustcheesemax: [Medium]
    let mediumstuffedcrustvegkebab, mediumStuffedCrustVegKebab, mediumstuffedcrustchickenseekhkebab, mediumStuffedCrustKebab: [Medium]?

    enum CodingKeys: String, CodingKey {
        case mediumPan, mediumstuffedcrustcheesemax, mediumstuffedcrustvegkebab
        case mediumStuffedCrustVegKebab = "medium stuffed crust-veg kebab"
        case mediumstuffedcrustchickenseekhkebab
        case mediumStuffedCrustKebab = "medium stuffed crust kebab"
    }
}

// MARK: - Medium
struct Medium: Codable {
    let price: Int
}
