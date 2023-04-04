//
//  UIViewController.swift
//  HammerTest
//
//  Created by Денис Ледовский on 03.04.2023.
//

import UIKit

fileprivate var activityView: UIView?

//MARK: - Alerts
extension UIViewController {

    func setErrorAlert(title: String, message: String) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: - ActivityIndicator
extension UIViewController {

    func showSpinner() {
        activityView = UIView(frame: self.view.bounds)
        activityView?.backgroundColor = .clear

        if #available(iOS 13.0, *) {
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = activityView!.center
            activityIndicator.startAnimating()
            activityView?.addSubview(activityIndicator)
        } else {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.center = activityView!.center
            activityIndicator.startAnimating()
            activityView?.addSubview(activityIndicator)
        }
        DispatchQueue.main.async {
            self.view.addSubview(activityView!)
        }
    }

    func hideSpinner() {
        DispatchQueue.main.async {
            activityView?.removeFromSuperview()
            activityView = nil
        }
    }
}

