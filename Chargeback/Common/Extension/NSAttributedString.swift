//
// Created by Douglas Mendes  on 3/30/18.
// Copyright (c) 2018 Douglas Mendes Barreto. All rights reserved.
//

import UIKit

enum NSAttributedStringError: Error {
    case problemToConvertStringToDataWithUnicode
    case problemToCreateAttributedStringWithHTMLString(reason: String)
}

extension NSAttributedString {

    static func titleLargePurple (withText text: String) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .purpleNu,
                                andFont: .systemFont(ofSize: FontSize.large, weight: .regular))
    }

    static func titleMediumPurple (withText text: String) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .purpleNu,
                                andFont: .systemFont(ofSize: FontSize.medium, weight: .regular))
    }

    static func titleMediumRead (withText text: String) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .redNu,
                                andFont: .systemFont(ofSize: FontSize.medium, weight: .regular))
    }

    static func titleSmallBlack (withText text: String) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .blackNu,
                                andFont: .systemFont(ofSize: FontSize.small, weight: .bold))
    }

    static func titleButtonPurple(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .purpleNu,
                                andFont: .systemFont(ofSize: FontSize.small, weight: .bold))
    }

    static func titleButtonGray(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .closeGrayNu,
                                andFont: .systemFont(ofSize: FontSize.small, weight: .bold))
    }
}

extension NSAttributedString {

    static func descriptionHTML (withText text: String ) throws -> NSAttributedString {
        return try attributedStringHTML(withText: text,
                                andFont: .systemFont(ofSize: FontSize.small))
    }

    static func descriptionGray(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .closeGrayNu,
                                andFont: .systemFont(ofSize: FontSize.xSmall, weight: .regular))
    }

    static func descriptionSmallGray (withText text: String) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .closeGrayNu,
                                andFont: .systemFont(ofSize: FontSize.xxSmall, weight: .regular))
    }

    static func descriptionRed(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .redNu,
                                andFont: .systemFont(ofSize: FontSize.xSmall, weight: .regular))
    }

    static func descriptionBlack(withText text: String ) -> NSAttributedString {
        return attributedString(withText: text,
                                andColor: .blackNu,
                                andFont: .systemFont(ofSize: FontSize.xSmall, weight: .regular))
    }

    static func attributedString (withText text: String, andColor color: UIColor, andFont font: UIFont) -> NSAttributedString {
        let nuAttributes: [NSAttributedStringKey: Any] = [.foregroundColor: color,
                                                          .font: font]
        return NSAttributedString(string: text, attributes: nuAttributes)
    }

    static func attributedStringHTML(withText text: String,
                                     andFont font: UIFont) throws -> NSAttributedString {
        var text = text
        text.append("<style>body{font-size:\(font.pointSize)px;}</style>")

        guard let stringData = text.data(using: .unicode) else {
            throw NSAttributedStringError.problemToConvertStringToDataWithUnicode
        }

        guard let mutableAttr = try? NSMutableAttributedString(data: stringData,
                                                           options: [.documentType: NSAttributedString.DocumentType.html],
                                                           documentAttributes: nil) else {
            throw NSAttributedStringError.problemToCreateAttributedStringWithHTMLString(reason: "Maybe string unicode is not valid")
        }

        return mutableAttr
    }
}
