//
//  UITableViewCell.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
