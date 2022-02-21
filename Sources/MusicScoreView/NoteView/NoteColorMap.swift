//  NoteColorMap.swift
//
//  Created by lively77 on 2022/2/20.

import Foundation
import SwiftUI
import MusicScore
import MusicSymbol

/// Given a Note in music score, return it's color
class NoteColorMap {
    
    /// get color by key of note, C, D, E, F, G, A, B
    static func getColorByNoteKey(note: NoteInScore) -> Color {
        switch note.pitch.key.type {
        case .a:
            return Color(hex: "#fc2847ff")!
        case .b:
            return Color(hex: "#ffa343ff")!
        case .c:
            return Color(hex: "#fdfc74ff")!
        case .d:
            return Color(hex: "#71bc78ff")!
        case .e:
            return Color(hex: "#0f4c81ff")!
        case .f:
            return Color(hex: "#7442c8ff")!
        case .g:
            return Color(hex: "#fb7efdff")!
        }
    }
    
    /// get color by pitch of this note
    static func getColorByNotePitch(note: NoteInScore) -> Color {
        let relativeToC4 = (note.pitch.rawValue - Pitch.C4.rawValue) / 2
        var index = 19 - relativeToC4
        index = max(0, index)
        index = min(index, 29)
        return Color(hex: colorStr[index])!
    }
    
    static let colorStr: [String] = ["#FF191CFF",
                                     "#FF4419FF",
                                     "#FF7219FF",
                                     "#FFA019FF",
                                     "#FFCE19FF",
                                     "#FFFC19FF",
                                     "#D4FF19FF",
                                     "#A6FF19FF",
                                     "#78FF19FF",
                                     "#4AFF19FF",
                                     "#1CFF19FF",
                                     "#19FF44FF",
                                     "#19FF72FF",
                                     "#19FFA0FF",
                                     "#19FFCEFF",
                                     "#19FFFCFF",
                                     "#19D4FFFF",
                                     "#19A6FFFF",
                                     "#1978FFFF",
                                     "#194AFFFF", // C4
                                     "#191CFFFF",
                                     "#4419FFFF",
                                     "#7219FFFF",
                                     "#A019FFFF",
                                     "#CE19FFFF",
                                     "#FC19FFFF",
                                     "#FF19D4FF",
                                     "#FF19A6FF",
                                     "#FF1978FF",
                                     "#FF194AFF"].reversed()
}


/// UIColor
/// Get color from hex string, e.g. 194AFFFF ,  fb7efdff
extension Color {
    public init?(hex: String) {
        let r, g, b: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    //                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b)
                    return
                }
            }
        }
        
        return nil
    }
}
