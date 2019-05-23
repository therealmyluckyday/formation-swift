//
//  BasicTypes.swift
//  FormationSwift
//
//  Created by MacBook on 5/21/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import Foundation

// MARK: - Basic Types
func basicTypes() {

    /**
     Int / UInt (8, 16, 32, 64)
     Float
     Double
     Bool
     String / Character
     Optional
     Tuple
     */
    let int = 42
    let uint: UInt = 42
    let uint64: UInt64 = 42
    let double = 3.14
    let float: Float = 3.14
    let bool = true
    let string = "Test"
    let char: Character = "C"
    let opt: String? = nil
    let tuple = (42, 3.14)

    /**
     On peut créer les alias de type avec `typealias`
     */
    typealias MyInt = Int
    let myInt: MyInt = 42
}

// MARK: - Literals
func literals() {

    /**
     Integer
     */
    let intL = 42
    let binary = 0b10001
    let octal = 0o21
    let hexadecimal = 0xdeadbeef

    /**
     Floating-point
     */
    let doubleL = 3.14
    let exp = 1.25e2    // 1.25x10ˆ2 == 125.0
    let hexExp = 0xFp2  // 15x2ˆ2 == 60.0

    /**
     Lisibilité
     */
    let oneMillion = 1000000
    let alsoOneMillion = 1_000_000

    /**
     String
     */
    let basic = "Example 1"
    let escaped = "Line \n break"
    let unicode = "\u{1F496}"   // 💖

    /**
     Boolean
     */
    let t = true
    let f = false
    let n: Any? = nil
}

// MARK: - Constants and Variables
func constantsAndVariables() {
    /**
     Type inferrence
     */
    let constString = "This is immutable"    // String
    var varString = "This is mutable"       // String
//    constString = "This is an error"
    varString = "This is OK"
    var mutableCopy = constString
    
    /**
     Type annotations
    */
    let explicitConst: String = "This is definately a String"
    var explicitVar: String = "This is a mutable String"
    
    /**
     Allowed characters
    */
    let this_Is_OK = "ok"
    let ThisIsOk2 = "ok"
//    let 4NotOk = "error"
    let 你好 = "你好世界"
    let π = 3.14159
    let 🐶🐮 = "dogcow"
    let ＃🚀 = "Hashrocket"
    let 💖 = "sparkling heart"
}

// MARK: - Tuples
func tuples() {
    
    /**
     Type et quantité
    */
    let simple = (1, "One")
    let explicit: (Int,String) = (2, "Two")
    let complex: (Int,Float,String,(String,Bool),Character) = (42, 3.14, "Test",("Nested",true),"\n")
    
    /**
     Anonymous
    */
    let anonPair: (Int,Bool) = (1, true)
    let first = anonPair.0
    let second = anonPair.1
    
    /**
     Named
    */
    let namedPair: (index: Int, selected: Bool) = (2, false)
    let index = namedPair.index
    let selected = namedPair.selected
}

// MARK: - Exercise 1
func exercise1() {
    
    /**
     1. Create a type alias of a named tuple that contains elements index (Int), title (String), and description (Optional<String>())
     2. Create a mutable instance of your type alias and modify its contents
    */
    
    
}

// MARK: - Operators
func operators() {
    
    /**
     Arithmetic
    */
    let add = 5 + 3
    let sub = 5 - 3
    let mul = 5 * 3
    let div = 5 / 3
    let divDouble = 5.0 / 3
    let divFloat: Float = 5 / 3
    let mod = 5 % 3
    
    /**
     Comparison
     ==, !=, >, <, >=, <=
    */
    
    /**
     Logical
     &&, ||, !
    */
    
    /**
     Bitwise
     &, |, ^, ~, <<, >>
    */
    
    /**
     Assignment
     =,
     +=, -=, *=, /=, %=,
     <<=, >>=, &=, |=
    */
    
    /**
     Ranges
    */
    let closed = (1...10)
    let halfOpen = 0..<10
    let oneSidedFromStart = 0...
    let oneSidedToEnd = ...10
    
    /**
     Ternary
    */
    let test = true ? 1 : 0
    
    /**
     Nil coalescing: ??
     */
    let optional: String? = nil
    let notNil = optional ?? ""
    
}

// MARK: - Conditions
func conditions() {
    
    let condition1 = true
    let condition2 = false
    
    /**
     if-else
    */
    if(condition1) {
        //
    }
    
    if condition1 {
        //
    } else {
        //
    }
    
    if condition1 {
        //
    } else if condition2 {
        //
    } else {
        //
    }
    
    /**
     Switch
    */
    let switchTest = 1
    var result = false
    var specialCase: String? = nil
    switch switchTest {
    case 1:
        result = true
    case 2, 3:
        result = true
    case 4:
        specialCase = "Got case 4"
        fallthrough
    case 5:
        result = true
    case 6:
        break
    default:
        result = false
    }
    
    /**
     Ternary: ?:
    */
    let ternary = condition1 ? "Yes" : "No"
    
    /**
     guard
     */
    guard condition1 else { return }
    debugPrint("condition1 is true")
    
}

// MARK: - Loops
func loops() {
    
    /**
     for-in
    */
    for i in 0...5 {
        // 0,1,2,3,4,5
    }
    
    for i in 0..<5 {
        // 0,1,2,3,4
    }
    
    for _ in 0..<5 {
        // do something 5 times
    }
    
    /**
     while
    */
    var condition1 = true
    var condition2 = false
    while condition1 {
        // do something
        if condition2 {
            condition1 = false
        }
    }
    
    while condition1 {
        // do something
        if condition2 {
            continue
        }
        
        break
    }
    
    /**
     repeat-while
    */
    repeat {
        // do something
        condition1 = false
    } while condition1
    
}

// MARK: - Strings
func strings() {
    
    let lineNumber = 16
    
    /**
     Initialization
    */
    let literal = "This is a literal string"
    let initialized = String("This is a string intialized with a String literal")
    let objcLiteral: NSString = "This is an NSString"
    let objcInitialized = NSString("This is an NSString")
    let objcInterop = NSString(string: initialized)
    let concat = "Hello" + ", " + "World" + "\n"
//    let concatError = "Line Number: " + lineNumber
    let interpolation = "Line Number: \(lineNumber)"
    let formatted = String(format: "Line Number: %02d", lineNumber)
    
    /**
     Multi-line
    */
    let quotation = """
Then Bob said, "Can you still call it an axe?"
Alice replied, "Lorem Ipsum, Bob"
"""
    let softWrapped = """
Then Bob said, "Can you still call it an axe?" \
Alice replied, "Lorem Ipsum, Bob"
"""
    
    /**
     Comparison
    */
    let test1 = "test"
    let test2 = "test"
    let test3 = "not equal"
    if test1 == test2 {
        debugPrint("equal")
    } else if test2 != test3 {
        debugPrint("not equal")
    }
    
    /**
     Mutablity
    */
    var mutable = "You can change this"
    mutable += ", this is ok"
    let immutable = "You can't change this"
//    immutable += ", this is an error"
    
    /**
     Characters
    */
    let string = "C"
    let char: Character = "C"
    let charInit = Character("C")
    let alphabet = "aàbcçdeëéèfghiïjklmnoöpqrstuüùvwxyz"
    let charCount = alphabet.count
    for ch in alphabet {
        debugPrint(ch)
    }
    alphabet.forEach { ch in
        debugPrint(ch)
    }
    let a = alphabet[alphabet.startIndex]
    var mutableCopy = alphabet
    mutableCopy.append(char)
    let array: [Character] = ["H", "e", "l", "l", "o"]
    let combined = String(array)
    
    /**
     Substrings
    */
    let greeting = "Hello, world!"
    let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
    let hello = greeting[..<index]
    let helloStr = String(hello)
    
}

// MARK: - Optionals
func optionals() {
    
    /**
     Declaration
    */
    var nonopt = "Non-optional"
//    nonopt = nil    // error
    var opt: String? = "Optional"
    opt = nil
    var opt2: String? = nil
    var optInt: Int? = nil
    var optTuple: (Int,String)? = nil
    
    /**
     Testing
    */
    if opt == nil {
        debugPrint("opt is nil")
    }
    if opt != nil {
        debugPrint("opt is not nil")
    }
    
    /**
     Unwrapping
    */
    var automaticUnwrapping: String!   // you must guarentee that dangerous will be initialized
    var forcedUnwrapping: String? = "Be careful"
    debugPrint(forcedUnwrapping!)
    var greeting: String? = "Hello, world!"
    if let optionalBinding = greeting {
        debugPrint(optionalBinding)
    }
    guard let guardBinding = greeting else {
        return
    }
    debugPrint(guardBinding)
    
    /**
     Optional Chaining
    */
    let countOpt = greeting?.count      // Int?
    let count = greeting?.count ?? 0    // Int
    let longExample = greeting?.firstIndex(of: "C")?.samePosition(in: "Test")
    
}

// MARK: - Collections
func collections() {
    
    /**
     Arrays
    */
    let arr1 = [1, 2, 3, 4, 5]
    let first = arr1.first
    let last = arr1.last
    let middle = arr1[2]    // !
    let slice = arr1[...2]
    let arr2 = Array(slice)
    let arr3: [Int] = arr2
    var empty1: [String] = []
    var empty2 = [String]()
    var empty3 = Array<Int>()
    empty1.append("new element")
    empty1.append(contentsOf: ["one", "two", "three"])
    empty1 += ["New Element"]
    empty1.remove(at: 0)
    empty1.insert("new element", at: 0)
    var count = empty1.count
    empty1.removeAll()
    
    /**
     Sets
    */
    let set1: Set<Int> = [1, 2, 3, 4, 5]
    var set2 = Set<Int>()
    var set3: Set<Int> = []
    set2.insert(1)
    let removed = set2.remove(1)
    if set2.contains(2) {
        set2.remove(2)
    }
    
    /**
     Dictionaries
    */
    let dic1 = ["Key1":"Value1", "Key2":"Value2"]
    let dic2: [String:String] = ["Key":"Value"]
    var empty4: [String:String] = [:]
    var empty5 = [String:String]()
    var empty6 = Dictionary<String,String>()
    empty4["Key"] = "Value"
    let val = empty4["Key"]
    let oldVal = empty4.updateValue("Value", forKey: "Key")
    let keys = empty4.keys
    let values = empty4.values
    if empty4.keys.contains("Key") {
        empty4.removeValue(forKey: "Key")
        empty4["Key"] = nil
    }
    let count2 = empty4.count
    
    /**
     Iteration
    */
    let array = [1, 2, 3, 4, 5]
    for i in 0..<array.count {
        let item = array[i]
        debugPrint(item.description)
    }
    for item in array {
        debugPrint(item.description)
    }
    array.forEach { item in
        debugPrint(item.description)
    }
    
    let set: Set<Int> = [1, 2, 3, 4, 5]
    for item in set {
        debugPrint(item.description)
    }
    set.forEach { item in
        debugPrint(item.description)
    }
    let setArray = Array(set)
    for i in 0..<setArray.count {
        let item = setArray[i]
        debugPrint(item.description)
    }
    
    let dictionary = [
        "North": 50,
        "East": 20,
        "South": 30,
        "West": 65
    ]
    for key in dictionary.keys {
        let value = dictionary[key]
        debugPrint("\(key): \(value)")
    }
    for (key,value) in dictionary {
        debugPrint("\(key): \(value)")
    }
    dictionary.forEach { (key,value) in
        debugPrint("\(key): \(value)")
    }
    
    /**
     Functional Operations
    */
    let testString = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
    let testData = testString.split(separator: " ")
    
    let mapped = testData.map { d in d.count }
    let filtered = testData.filter { d in d.count > 5 }
    let flatMapped = testData.flatMap { d in d }
    let find = try testData.first { d in
        d == "Lorem"
    }
    let composed = testData.map { d in d.count }
        .filter { count in count > 5 }
        .map { count in (count == 7) }
    
    let multiDimen: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    let flattened = multiDimen.flatMap { arr in arr }
    
    let descending = flattened.sorted { lhs, rhs in lhs > rhs }
}

// MARK: - Exercise 2
func exercise2() {
    
    /**
     Given the following data:
    */
    typealias Player = (name: String, score: Int)
    
    let players: [Player] = [
        (name: "BBB", score: 80_000),
        (name: "AAA", score: 80_000),
        (name: "CCC", score: 100_000),
        (name: "BAD", score: 5_000),
        (name: "DDD", score: 60_000)
    ]
    
    /**
     Create an array of the top 3 players by score.
     If two or more players have the same score, sort by alphabetical order
    */
    
}
