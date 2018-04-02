//
//  RootViewController.swift
//  Chargeback
//
//  Created by Douglas Mendes  on 3/24/18.
//  Copyright © 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class RootViewControllerFactory {
    static func make() -> UIViewController {
        let viewController = NoticeViewController()
        //let viewController = ChargebackViewController()
        return viewController
    }
}
