//
//  Design.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

enum Design {
    enum Image {
//        static let magnifyingglass = UIImage(systemName: "magnifyingglass")
        static let check = UIImage(systemName: "checkmark")
//        static let chevronDown = UIImage(systemName: "chevronDown")
        static let chevronDown = UIImage(named: "chevronDown")
//        static let phoneCircle = UIImage(named: "phone-circle")
//        static let profile = UIImage(named: "profile")
//        static let minus = UIImage(named: "Minus")
//        static let plus = UIImage(named: "Plus")
//        static let supportIco = UIImage(named: "support-ico")
//        static let cartIco = UIImage(named: "cart-ico")
//        static let listIco = UIImage(named: "list-ico")
//        static let profileIco = UIImage(named: "profile-ico")
//        static let cardImg = UIImage(named: "cart-img")
//        static let discountImg = UIImage(named: "discount-img")
//        static let edit = UIImage(named: "edit")
//        static let close = UIImage(named: "closeButton")
//        static let orderDone = UIImage(named: "orderDone")
//        static let navigation = UIImage(named: "navigation")
//        static let product = UIImage(named: "ProductImage1")

        static let addressIcon = UIImage(named: "addressIcon")
        static let cartIcon = UIImage(named: "cartIcon")
        static let menuIcon = UIImage(named: "menuIcon")
        static let profileIcon = UIImage(named: "profileIcon")

        static let banner1 = UIImage(named: "banner1")
        static let banner2 = UIImage(named: "banner2")
        static let banner3 = UIImage(named: "banner3")

        static let testCellImg = UIImage(named: "testCellImg")

//        static let buket = UIImage(named: "buket")
//        static let celebs = UIImage(named: "celebs")
//        static let discount = UIImage(named: "discount")
//        static let flowers = UIImage(named: "flowers")
//        static let gifts = UIImage(named: "gifts")
//        static let pioni = UIImage(named: "pioni")
//        static let rouses = UIImage(named: "rouses")
//        static let tulpan = UIImage(named: "tulpan")
    }

    enum Color {
        static let white = UIColor.white

        static let black = UIColor.black
        static let brandBlack = UIColor(named: "brandBlack")!
        static let blackAlpha = UIColor(named: "blackAlpha")!
        static let startShadow = UIColor(named: "startShadow")!
        static let endShadow = UIColor(named: "endShadow")!

        static let basePink = UIColor(named: "basePink")!
        static let basePinkAlpha20 = UIColor(named: "basePinkAlpha20")!
        static let basePinkAlpha40 = UIColor(named: "basePinkAlpha40")!

        static let grayTabBar = UIColor(named: "grayTabBar")!
        static let grayForGradient = UIColor(named: "grayForGradient")!
        static let grayDescription = UIColor(named: "grayDescription")!
    }

    enum Font {
        static let h1 = UIFont.systemFont(ofSize: 17, weight: .medium)
        static let h1SemiBold = UIFont.systemFont(ofSize: 17, weight: .semibold)
        static let h2 = UIFont.systemFont(ofSize: 13, weight: .medium)
        static let h2Bold = UIFont.systemFont(ofSize: 13, weight: .bold)
        

        static let h3 = UIFont.systemFont(ofSize: 20, weight: .medium)
        static let h4 = UIFont.systemFont(ofSize: 18, weight: .medium)
        static let h5 = UIFont.systemFont(ofSize: 15, weight: .medium)
        static let h6 = UIFont.systemFont(ofSize: 14, weight: .medium)

        static let date1 = UIFont.systemFont(ofSize: 20, weight: .regular)
        static let date2 = UIFont.systemFont(ofSize: 13, weight: .semibold)
        static let date3 = UIFont.systemFont(ofSize: 20, weight: .semibold)

        static let type1 = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let type2 = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let type1Bold = UIFont.systemFont(ofSize: 16, weight: .bold)

        static let button = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let tab = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let text = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let caption = UIFont.systemFont(ofSize: 12, weight: .regular)
        static let tabBar = UIFont.systemFont(ofSize: 10, weight: .medium)
    }
}

