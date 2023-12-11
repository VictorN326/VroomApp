//
//  Color.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/11/23.
//

import Foundation
import SwiftUI
extension Color {
    static let theme =  ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("backgroundColor")
    let secondaryBackgroundColor = Color("secondarybackgroundColor")
    let primaryTextColor = Color("primaryTextColor")
}
