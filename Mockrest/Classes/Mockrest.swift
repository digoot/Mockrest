//
//  Mockrest.swift
//  Mockrest
//
//  Created by Diego Otero Mata on 02/11/2019.
//

import Foundation

public enum Capitalization {
    case all
    case first
    case none
}

public func randomUUID() -> String {
    return UUID().uuidString
}

public func randomEmail() -> String {
    return randomAlphaNumeric(size: Int.random(in: 5...10), capitalization: .none) + "@" + randomAlpha(size: Int.random(in: 5...10), capitalization: .none) + ".com"
}

public func randomDate() -> String {
    let dateFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    return formatter.string(from: Date())
}

public func wordAlpha(capitalized: Capitalization) -> String {
    return wordingGenerator(1, capitalize: capitalized)
}

public func wordAlphaNumeric(capitalized: Capitalization) -> String {
    return randomAlphaNumeric(size: Int.random(in: 2...10), capitalization: capitalized)
}

public func randomNumber(size: Int) -> Int {
    return generateRandomNumber(size: size)
}

public func wordingGenerator(_ quantity: Int, capitalize: Capitalization) -> String {
    var text = ""
    for n in 1...quantity {
        text += randomAlpha(size: Int.random(in: 2...10), capitalization: capitalize)
        if n < quantity {
            text += " "
        }
    }
    return text
}

public func response<T>(_ entity: T) -> Data where T : Decodable, T : Encodable {
    return toJSON(entity)
}

fileprivate func generateRandomNumber(size: Int) -> Int {
    var place = 1
    var finalNumber = 0
    var _size = 1
    if size <= 1 {
        return Int.random(in: 0...9)
    }
    if size > 9 {
        _size = 9
    } else {
        _size = size
    }
    for _ in 0..<_size {
        place *= 10
        let randomNumber = Int.random(in: 0...9)
        finalNumber += randomNumber * place
    }
    return finalNumber
}

fileprivate func randomAlpha(size: Int, capitalization: Capitalization) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyz"
    var result = String()
    switch capitalization {
    case .all:
        result = String((0..<size).map { _ in letters.randomElement()! }).uppercased()
    case .first:
        result = (letters.randomElement())!.uppercased()
        result += (1..<size).map { _ in letters.randomElement()! }
    case .none:
        result = String((0..<size).map { _ in letters.randomElement()! })
    }
    return result
}

fileprivate func randomAlphaNumeric(size: Int, capitalization: Capitalization) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyz"
    let all = "abcdefghijklmnopqrstuvwxyz1234567890"
    var result = String()
    switch capitalization {
    case .all:
        result = String((0..<size).map { _ in all.randomElement()! }).uppercased()
    case .first:
        result = (letters.randomElement())!.uppercased()
        result += (1..<size).map { _ in all.randomElement()! }
    case .none:
        result = String((0..<size).map { _ in all.randomElement()! })
    }
    return result
}

fileprivate func toJSON<T: Codable>(_ entity: T) -> Data {
    return try! JSONEncoder().encode(entity)
}
