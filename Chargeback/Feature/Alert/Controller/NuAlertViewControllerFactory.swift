//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class NuAlertViewControllerFactory {
    static func make (title: String,
                      description: String,
                      buttonTitle: String,
                      type: NuAlertType,
                      action: (() -> ())? = nil) -> UIViewController {
        return NuAlertViewController(title: NuAlertConst.successTitle,
                                     description: NuAlertConst.successDescription,
                                     buttonTitle: NuAlertConst.closeButtonTitle,
                                     type: .success, action: action)
    }
}
