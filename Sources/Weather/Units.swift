import Foundation

public enum Units: String, CaseIterable, Decodable {
    case us, ca, uk2, si
    
    public static let auto: Units = .us
}

extension Units: CustomStringConvertible {
    
    // MARK: CustomStringConvertible
    public var description: String {
        switch self {
        case .us:
            return "\(UnitTemperature.fahrenheit.symbol), \(UnitLength.miles.symbol), \(UnitSpeed.milesPerHour.symbol)"
        case .ca:
            return "\(UnitTemperature.celsius.symbol), \(UnitLength.kilometers.symbol), \(UnitSpeed.kilometersPerHour.symbol)"
        case .uk2:
            return "\(UnitTemperature.celsius.symbol), \(UnitLength.miles.symbol), \(UnitSpeed.milesPerHour.symbol)"
        case .si:
            return "\(UnitTemperature.celsius.symbol), \(UnitLength.kilometers.symbol), \(UnitSpeed.metersPerSecond.symbol)"
        }
    }
}

extension Units {
    public var accumulation: UnitLength {
        switch self {
        case .us:
            return .inches
        case .ca, .uk2, .si:
            return .centimeters
        }
    }
    
    public var distance: UnitLength {
        switch self {
        case .us, .uk2:
            return .miles
        case .ca, .si:
            return .kilometers
        }
    }
    
    public var intensity: UnitLength {
        switch self {
        case .us:
            return .inches
        case .ca, .uk2, .si:
            return .millimeters
        }
    }
    
    public var pressure: UnitPressure {
        switch self {
        case .us:
            return .inchesOfMercury
        case .ca, .uk2, .si:
            return .hectopascals
        }
    }
    
    public var speed: UnitSpeed {
        switch self {
        case .us, .uk2:
            return .milesPerHour
        case .ca:
            return .kilometersPerHour
        case .si:
            return .metersPerSecond
        }
    }
    
    public var temperature: UnitTemperature {
        switch self {
        case .us:
            return .fahrenheit
        case .ca, .uk2, .si:
            return .celsius
        }
    }
}
