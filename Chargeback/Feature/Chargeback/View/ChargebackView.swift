//
// Created by douglas.barreto on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class ChargebackView: BindableView<ChargebackViewModel> {

    private let titleLabel: UILabel
    private let headerContentView: UIView

    private let bodyContentView: UIView
    private let bottomContentView: UIView
    private let buttonsStackView: UIStackView

    override init (frame: CGRect = .zero) {
        titleLabel = UILabel()
        bodyContentView = UIView()
        bottomContentView = UIView()
        headerContentView = UIView()
        buttonsStackView = UIStackView()
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    override func bind (to viewModel: ViewModel) {
        titleLabel.attributedText = viewModel.title
    }
}

// MARK: Layout Chargeback View

extension ChargebackView {
    private func setupLayout () {
        setupHeaderLayout()
        setupTitleLayout()
    }

    private func setupTitleLayout () {
        titleLabel.textAlignment = .center
        headerContentView.addSubview(titleLabel)
        titleLabel.startAnchor()
                  .leadingAnchor(to: headerContentView)
                  .trailingAnchor(to: headerContentView)
                .centerYAnchor.constraint(equalTo: headerContentView.centerYAnchor).isActive = true
    }

    private func setupHeaderLayout () {
        addChild(view: headerContentView)
        headerContentView.backgroundColor = .greenNu
        headerContentView.startAnchor()
                         .topAnchor(to: contentView)
                         .leadingAnchor(to: contentView)
                         .trailingAnchor(to: contentView)
                .heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
