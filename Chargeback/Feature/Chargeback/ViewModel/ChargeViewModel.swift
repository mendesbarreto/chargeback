//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

struct ChargebackViewModel {
    let title: NSAttributedString
    let reasonCardInPossessionViewModel: ReasonDetailViewModel
    let reasonMerchantViewModel: ReasonDetailViewModel
    let descriptionHint: NSAttributedString

    let titleContestButton: NSAttributedString
    let titleContestDisabledButton: NSAttributedString
    let titleCancelButton: NSAttributedString

    let isCardInPossession: Bool
    let isMerchantRecognized: Bool
}
