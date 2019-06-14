//
//  UIKitStyles.swift
//  Drive4Show
//
//  Created by Benjamin Hakes on 6/14/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Base Style Methods
func autolayoutStyle<V: UIView>(_ view: V) -> Void {
    view.translatesAutoresizingMaskIntoConstraints = false
}

func roundedRectStyle<View: UIView>(_ view: View) {
    view.clipsToBounds = true
    view.layer.cornerRadius = 6
}

// MARK: - TextFields
let baseTextFieldStyle: (UITextField) -> Void = {
    $0.textColor = .gray
}

let secureTextFieldStyle: (UITextField) -> Void = {
    $0.isSecureTextEntry = true
}

let separatorViewStyle: (UIView) -> Void = {
    $0.backgroundColor = .gray
}


// MARK: - Compound Styles
let roundedAutolayoutView = autolayoutStyle <> roundedRectStyle
let entryTextFieldStyle = baseTextFieldStyle <> autolayoutStyle
let passwordTextFieldStyle = baseTextFieldStyle <> autolayoutStyle <> secureTextFieldStyle
let separatorStyle = autolayoutStyle <> separatorViewStyle

