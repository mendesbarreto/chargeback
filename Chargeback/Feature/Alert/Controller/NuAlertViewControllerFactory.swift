//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class NuAlertViewControllerFactory {
    static func make(title: String = Strings.NuAlert.successTitle,
                     description: String = Strings.NuAlert.successDescription,
                     buttonTitle: String = Strings.NuAlert.closeButtonTitle,
                     type: NuAlertType = .success,
                     action: (() -> Void)? = nil) -> UIViewController {
        return NuAlertViewController(title: title,
                                     description: description,
                                     buttonTitle: buttonTitle,
                                     type: type,
                                     action: action)
    }
}
