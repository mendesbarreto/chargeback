//
// Created by douglas.barreto on 3/24/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxSwift

final class NoticeViewController: BaseViewController {

    let noticeGateway: ResourceGateway & EntryPointResourceGateway

    init(noticeGateway: ResourceGateway & EntryPointResourceGateway) {
        self.noticeGateway = noticeGateway
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    var noticeViewModel: NoticeViewModel {
        return NoticeViewModel(title: .titlePurple(withText: "Antes de continuar"),
                               description: .descriptionHTMLGray(withText: "<p>Estamos com você nesta! Certifique-se dos pontos abaixo, são muito importantes:<br/><strong>• Você pode <font color=\"#6e2b77\">procurar o nome do estabelecimento no Google</font>. Diversas vezes encontramos informações valiosas por lá e elas podem te ajudar neste processo.</strong><br/><strong>• Caso você reconheça a compra, é muito importante pra nós que entre em contato com o estabelecimento e certifique-se que a situação já não foi resolvida.</strong></p>"),
                               continueButtonTitle: .titleButtonPurple(withText: "Continuar"),
                               closeButtonTitle: .titleButtonGray(withText: "Fechar"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let noticeView = NoticeView()
        view.addSubview(noticeView)
        view.backgroundColor = .backgroundNu
        noticeView.bind(to: noticeViewModel)
        noticeView.startAnchor().anchorToFit(in: view)
    }
}
