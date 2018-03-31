//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

struct ChargeBackViewModel {
    let title: NSAttributedString

    let descriptionLockedCard: NSAttributedString
    let descriptionUnLockedCard: NSAttributedString
    let descriptionMerchantRecognized: NSAttributedString
    let descriptionCardInPossession: NSAttributedString
    let descriptionHint: NSAttributedString

    let titleContestButton: NSAttributedString
    let titleCancelButton: NSAttributedString

    let isCardInPossession: Bool
    let isMerchantRecognized: Bool

    let lockIconImage: UIImage
    let unLockIconImage: UIImage
}
