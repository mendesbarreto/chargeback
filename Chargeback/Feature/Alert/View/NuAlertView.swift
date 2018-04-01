//
// Created by douglas.barreto on 4/1/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class NuAlertView: BindableView<NuAlertViewModel> {
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let actionButton = UIButton()

    private let headerContentView = UIView()
    private let bodyContentView = UIView()
    private let bottomContentView = UIView()
    private let contentStackView = UIStackView()

    var onButtonTap: SharedSequence<SignalSharingStrategy, Void> {
        return actionButton.rx.tap.asSignal(onErrorJustReturn: ())
    }

    override init (frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not implemented", file: #file, line: #line)
    }

    override func bind (to viewModel: ViewModel) {
        super.bind(to: viewModel)
        titleLabel.attributedText = viewModel.title
        descriptionLabel.attributedText = viewModel.description
        actionButton.setAttributedTitle(viewModel.buttonTile, for: .normal)
    }
}

// MARK: Setup Layout Nu Alert

extension NuAlertView {
    private func setupLayout () {
        setupConentViewLayout()
        setupTitleLayout()
        setupDescriptionLayout()
        bottomContentView.addSubview(actionButton)
        actionButton.anchorToFit(in: bottomContentView)
    }

    private func setupDescriptionLayout () {
        bodyContentView.addSubview(descriptionLabel)
        descriptionLabel.textAlignment = .center
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.startAnchor()
                        .topAnchor(to: bodyContentView)
                        .leadingAnchor(to: bodyContentView)
                        .trailingAnchor(to: bodyContentView)
    }

    private func setupTitleLayout () {
        headerContentView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 2
        titleLabel.anchorToFit(in: headerContentView)
    }

    private func setupConentViewLayout () {
        headerContentView.backgroundColor = .clear
        bodyContentView.backgroundColor = .clear
        bottomContentView.backgroundColor = .clear
        addChild(view: contentStackView)
        contentStackView.startAnchor()
                        .topAnchor(to: contentView, constant: 10)
                        .leadingAnchor(to: contentView, constant: 15)
                        .trailingAnchor(to: contentView, constant: -15)
                        .bottomAnchor(to: contentView, constant: -10)
        contentStackView.axis = .vertical
        contentStackView.distribution = .fillEqually
        contentStackView.addArrangedSubview(headerContentView)
        contentStackView.addArrangedSubview(bodyContentView)
        contentStackView.addArrangedSubview(bottomContentView)
    }
}
