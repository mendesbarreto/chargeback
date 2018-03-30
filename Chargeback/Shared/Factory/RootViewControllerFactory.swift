//
//  RootViewController.swift
//  Chargeback
//
//  Created by douglas.barreto on 3/24/18.
//  Copyright © 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class RootViewControllerFactory {
    static func make() -> UIViewController {
        let gateway = EntryPointResourceMoyaGateway()
        let viewController = NoticeViewController(noticeGateway: gateway)
        return viewController
    }
}
