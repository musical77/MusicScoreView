//  NoteColorMap.swift
//
//  Created by lively77 on 2022/2/5.

import Foundation
import MusicScore
import UIKit

class NoteColorMap {
    static func getColor(note: NoteInScore) -> UIColor {
        //        note.note.pitch.key
        // #fc2847ff, #ffa343ff, #fdfc74ff, #71bc78ff, #0f4c81ff, #7442c8ff, #fb7efdff
        switch note.pitch.key.type {
        case .a:
            return UIColor(hex: "#fc2847ff")!
        case .b:
            return UIColor(hex: "#ffa343ff")!
        case .c:
            return UIColor(hex: "#fdfc74ff")!
        case .d:
            return UIColor(hex: "#71bc78ff")!
        case .e:
            return UIColor(hex: "#0f4c81ff")!
        case .f:
            return UIColor(hex: "#7442c8ff")!
        case .g:
            return UIColor(hex: "#fb7efdff")!
        }
    }
    
    static func getColor(instrument: InstrumentType) -> UIColor {
        switch instrument {
        case .piano:
            return UIColor.green
        case.violin:
            return UIColor.red
        default:
            return UIColor.blue
        }
    }
}

/// UIColor
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
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
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
