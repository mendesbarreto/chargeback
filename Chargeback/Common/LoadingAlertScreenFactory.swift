//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class LoadingAlertScreenFactory {
    static func make () -> UIAlertController {
        let alertViewController = UIAlertController(title: nil, message: Strings.LoadingAlert.message, preferredStyle: .alert)
        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicatorView.startAnimating()
        alertViewController.view.addSubview(activityIndicatorView)
        return alertViewController
    }
}
