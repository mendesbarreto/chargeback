//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class ChargebackViewController: BaseViewController {
    private let chargebackView: ChargebackView
    private var showChargebackUserCase: ShowChargebackInformationUseCase!

    override init() {
        chargebackView = ChargebackView()
        super.init()
        showChargebackUserCase = ShowChargebackInformationUseCaseFactory.make(presenterOutput: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented", file: #file, line: #line)
    }

    override func viewDidLoad () {
        super.viewDidLoad()
        setupLayout()
        setupChargebackView()
        showChargebackUserCase.show()
    }

    private func setupLayout () {
        view.backgroundColor = .backgroundNu
    }

    private func setupChargebackView() {
        view.addSubview(chargebackView)
        chargebackView.anchorToFit(in: view)
    }
}

extension ChargebackViewController: ChargebackPresenterOutput {
    func show (chargebackViewModel: ChargeBackViewModel) {
        chargebackView.bind(to: chargebackViewModel)
    }

    func showError () {
        //TODO: SHOW ALERT WITH ERRO
    }
}
