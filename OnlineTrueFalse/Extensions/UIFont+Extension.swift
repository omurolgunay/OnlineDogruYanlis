//
//  Font.swift
//  Online Doğru Yanlış
//
//  Created by omur olgunay on 22.07.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation
import UIKit

extension UIFont{
    func prefredFont(size: CGFloat, for forTextStyle: UIFont.TextStyle) -> UIFont {
        var prefferedFont = UIFont.preferredFont(forTextStyle: forTextStyle).withSize(size)
        if #available(iOS 11.0, *) {
            prefferedFont = UIFontMetrics(forTextStyle: forTextStyle).scaledFont(for: prefferedFont)
        }
        return prefferedFont
    }
}
