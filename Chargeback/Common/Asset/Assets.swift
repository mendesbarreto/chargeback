//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

enum Assets: String {
    case icChargebackLock = "ic_chargeback_lock"
    case icChargebackUnlock = "ic_chargeback_unlock"

    var image: UIImage {
        return UIImage(asset: self)
    }
}

extension UIImage {
    convenience init!(asset: Assets) {
        self.init(named: asset.rawValue)
    }
}
