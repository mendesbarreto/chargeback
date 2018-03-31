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

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        print("this class can not be initialized for NSCoder arg")
        return nil
    }
}
