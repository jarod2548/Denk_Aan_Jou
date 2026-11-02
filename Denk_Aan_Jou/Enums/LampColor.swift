import Foundation
import SwiftUI
import UIKit

struct LampColor: Codable {
    var red: Double
    var green: Double
    var blue: Double

    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    
}

extension LampColor {
    init?(color: Color) {
        let uiColor = UIColor(color)

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard uiColor.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha
        ) else {
            return nil
        }

        self.init(
            red: Double(red),
            green: Double(green),
            blue: Double(blue)
        )
    }
}

