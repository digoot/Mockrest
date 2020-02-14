//
//  Mockrest.swift
//  Mockrest
//
//  Created by Diego Otero Mata on 02/11/2019.
//

import Foundation
import Fakery

public struct Configuration {

    internal var faker: Faker

    public static var `default`: Configuration {
        get {
            return defaultInitialization()
        }
        set {
            customInitialization(configuration: newValue)
        }
    }

    init() {
        faker = Faker()
    }

    internal static func defaultInitialization() -> Configuration {
        let configuration = Configuration()
        if let currentLocale = NSLocale.current.languageCode {
            configuration.faker.locale = currentLocale
        } else {
            configuration.faker.locale = "en"
        }
        return configuration
    }

    internal static func customInitialization(configuration: Configuration) {
        
    }

}

public func response<T>(_ entity: T) -> Data where T : Decodable, T : Encodable {
    return toJSON(entity)
}

fileprivate func toJSON<T: Codable>(_ entity: T) -> Data {
    return try! JSONEncoder().encode(entity)
}
