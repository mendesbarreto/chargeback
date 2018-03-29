//
// Created by douglas.barreto on 3/25/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class NoticeView: BindableView<NoticeViewModel> {

    private let titleLabel: UILabel
    private let descriptionLabel: UILabel
    private let continueButton: UIButton
    private let closeButton: UIButton

    private let labelsStackView: UIStackView
    private let buttonStackView: UIStackView

    override init(frame: CGRect = .zero) {
        titleLabel = UILabel()
        descriptionLabel = UILabel()
        continueButton = UIButton()
        closeButton = UIButton()
        labelsStackView = UIStackView()
        buttonStackView = UIStackView()
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    private func setupLayout() {
        titleLabel.text = "Hello"
        descriptionLabel.text = "Hello2"
        continueButton.setTitle("OMG", for: .normal)
        closeButton.setTitle("OMG2", for: .normal)
        setupLabelStackView()
        setupButtonStackView()
    }

    private func setupButtonStackView() {
        addSubview(labelsStackView)
        buttonStackView.addArrangedSubview(titleLabel)
        buttonStackView.addArrangedSubview(descriptionLabel)
        buttonStackView.axis = .vertical
        buttonStackView.startAnchor()
                       .bottomAnchor(to: self)
                       .leadingAnchor(to: self)
                       .trailingAnchor(to: self)
                       .topAnchor.constraint(equalTo: labelsStackView.bottomAnchor).isActive = true
    }

    private func setupLabelStackView() {
        addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
        labelsStackView.axis = .vertical
        labelsStackView.startAnchor()
                       .topAnchor(to: self)
                       .leadingAnchor(to: self)
                       .trailingAnchor(to: self)
    }
}
