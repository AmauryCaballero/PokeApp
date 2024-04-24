//
//  FontTheme.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI

fileprivate struct CustomFont: ViewModifier {
    var textStye: TextStyle
    
    func body(content: Content) -> some View {
        content.font(.custom(textStye.name, size: textStye.size, relativeTo: textStye.relative))
    }
}

extension View {
    func pokeFont(_ textStyle: TextStyle = .body) -> some View {
        modifier(CustomFont(textStye: textStyle))
    }
}

enum TextStyle {
    case headline
    case subHeadline
    case title
    case title2
    case body
    case button
    case footNote
    
    
    var name: String {
        switch self {
        case .headline:
            "Montserrat-ExtraBold"
        case .subHeadline, .title:
            "Montserrat-Bold"
        case .title2:
            "Montserrat-Light"
        case .body:
            "Montserrat-Regular"
        case .button:
            "Montserrat-Medium"
        case .footNote:
            "Montserrat-Regular"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .headline:
            62
        case .subHeadline:
            52
        case .title:
            45
        case .title2:
            34
        case .body:
            16
        case .button:
            16
        case .footNote:
            13
        }
    }
    
    var relative: Font.TextStyle {
        switch self {
        case .headline:
                .headline
        case .subHeadline:
                .subheadline
        case .title:
                .title
        case .title2:
                .title2
        case .body:
                .body
        case .button:
                .body
        case .footNote:
                .footnote
        }
    }
}
