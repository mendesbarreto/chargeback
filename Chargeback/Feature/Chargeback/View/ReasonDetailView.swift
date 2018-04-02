//
// Created by Douglas Mendes on 3/31/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

final class ReasonDetailView: BindableView<ReasonDetailViewModel> {
    private let descriptionLabel: UILabel = UILabel()
    private let toggleSwitch: UISwitch = UISwitch()

    var isOn: Bool {
        return toggleSwitch.isOn
    }

    override init (frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This view could not be initialized by coder", file: #file, line: #line)
    }

    override func bind (to viewModel: ViewModel) {
        super.bind(to: viewModel)
        descriptionLabel.attributedText = viewModel.description
    }
}

// MARK: Layout Reason Detail View

extension ReasonDetailView {
    private func setupLayout () {
        addSubview(descriptionLabel)
        addSubview(toggleSwitch)
        toggleSwitch.startAnchor()
                    .trailingAnchor(to: self)
        toggleSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        descriptionLabel.startAnchor()
                        .leadingAnchor(to: self)
                .trailingAnchor.constraint(equalTo: toggleSwitch.leadingAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
}
