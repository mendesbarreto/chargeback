//
// Created by douglas.barreto on 3/28/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

extension UIView {

    func startAnchor() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    func anchorToFit(in view: UIView) -> Self {
        startAnchor()
        return trailingAnchor(to: view).leadingAnchor(to: view)
                                       .bottomAnchor(to: view)
                                       .topAnchor(to: view)
    }

    @discardableResult
    func leadingAnchor(to view: UIView, constant: CGFloat = 0) -> Self {
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func trailingAnchor(to view: UIView, constant: CGFloat = 0) -> Self {
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func topAnchor(to view: UIView, constant: CGFloat = 0) -> Self {
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func bottomAnchor(to view: UIView, constant: CGFloat = 0) -> Self {
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constant).isActive = true
        return self
    }
}
