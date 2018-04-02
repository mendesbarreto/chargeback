//
//  BaseViewController.swift
//  Chargeback
//
//  Created by Douglas Mendes  on 3/24/18.
//  Copyright © 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

    let disposableBag = DisposeBag()
    private var loadingAlert: UIAlertController?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        print("this class can not be initialized for NSCoder arg")
        return nil
    }
}

extension BaseViewController: LoadablePresenter {
    func showLoading () {
        loadingAlert = LoadingAlertScreenFactory.make()
        present(loadingAlert!, animated: true)
    }

    func hideLoading (onComplete: (() -> ())?) {
        loadingAlert?.dismiss(animated: true) {
            onComplete?()
        }
    }
}
