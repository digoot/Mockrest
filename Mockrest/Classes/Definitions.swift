//
//  Definitions.swift
//  Mockrest
//
//  Created by Diego Otero Mata on 11/02/2020.
//

import Foundation
import Fakery

fileprivate let faker = Configuration.default.faker

private protocol ObjectRandomizable {
    associatedtype T
    var value: T { get }
}

struct UUID: ObjectRandomizable {
    var value: String
    init() {
        value = NSUUID().uuidString
    }
}

struct Name: ObjectRandomizable {
    var value: String
    init () {
        value =  faker.name.firstName()
    }
}

struct Surname: ObjectRandomizable {
    var value: String
    init() {
        value = faker.name.lastName()
    }
}

struct Number: ObjectRandomizable {
    var value: Int
    init() {
        value = faker.number.randomInt()
    }
}

struct Text: ObjectRandomizable {
    var value: String
    init(paragraphs: Int) {
        value = faker.lorem.paragraphs(amount: paragraphs)
    }
    init(characters: Int) {
        value = faker.lorem.characters(amount: characters)
    }
    init(sentences: Int) {
        value = faker.lorem.paragraph(sentencesAmount: sentences)
    }
}

struct Email: ObjectRandomizable {
    var value: String
    init() {
        value = faker.internet.email()
    }
}

struct Phone: ObjectRandomizable {
    var value: String
    init() {
        value = faker.phoneNumber.phoneNumber()
    }
}
