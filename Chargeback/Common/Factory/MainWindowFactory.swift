//
//  MainWindowFactory.swift
//  Chargeback
//
//  Created by Douglas Mendes  on 3/24/18.
//  Copyright © 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class MainWindowFactory {
    static func make() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = RootViewControllerFactory.make()
        window.makeKeyAndVisible()
        return window
    }
}
