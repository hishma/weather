import Foundation
import Weather

extension MoonPhase {
    var symbol: String {
        switch name {
        case .new:
            return "🌑"
        case .crescent(let direction):
            return direction == .waxing ? "🌒" : "🌘"
        case .quarter(let direction):
            return direction == .waxing ? "🌓" : "🌗"
        case .gibbous(let direction):
            return direction == .waxing ? "🌔" : "🌖"
        case .full:
            return "🌕"
        }
    }
}
