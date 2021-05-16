//: [Previous](@previous)

import Foundation

struct Person: Codable {
    var name: String
    var age: Int
}

let jsonString = """
[
    {
        "name": "Taylor Swift",
        "age": 26
    },
    {
        "name": "Justin Bieber",
        "age": 25
    }
]
"""

let jsonData = Data(jsonString.utf8)
let decoder = JSONDecoder()

do {
    let people = try decoder.decode([Person].self, from: jsonData)
    for person in people {
        print("name: \(person.name)\nage: \(person.age)")
    }
} catch {
    print(error.localizedDescription)
}
