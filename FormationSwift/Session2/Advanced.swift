//
//  Advanced.swift
//  FormationSwift
//
//  Created by MacBook on 5/22/19.
//  Copyright © 2019 MyLuckyDay. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

typealias Coffee = String

// MARK: - Functions

/**
 Syntax
 */
func f() {}
func f1(p1: String) {}
func f2(p1: String, p2: Int) -> Bool {
    return true
}

/**
 Parameters
 */
func make(coffee: Coffee) {
    debugPrint(coffee)
}
func make(espresso e: Coffee) {
    debugPrint(e)
}
func make(_ americano: Coffee) {
    debugPrint(americano)
}
func make(coffees: Coffee...) {
    debugPrint(coffees)
}
func make(cafe: inout Coffee) {
    cafe += " made"
}

func parameters() {
    
    make(coffee: "Long")
    make(espresso: "Espresso")
    make("Americano")
    make(coffees: "Long", "Espresso", "Americano")
    
    var noisette: Coffee = "Noisette"
    make(cafe: &noisette)
    debugPrint(noisette)
}

/**
 Closures
 */
func closures() {
    
    /**
     Syntax
    */
    let f1: (_ name: String, _ age: Int)->Void = { (name: String, age: Int) -> Void in
        debugPrint("\(name): \(age)")
    }
    
    let f2 = { (name: String, age: Int) -> Void in
        debugPrint("\(name): \(age)")
    }
    
    let f3: (String,Int)->Void = {
        debugPrint("\($0): \($1)")
    }
    
    f3("Name", 15)
    
    func search(query: String, callback: ([String])->Void) {
        // do search
        callback([])
    }
    
    search(query: "Restaurants", callback: { results in
        debugPrint(results)
    })
    
    search(query: "Hospitals") {
        debugPrint($0)
    }
    
    let curryedMultiplier: (_ step: Int) -> (Int) -> Int = { step in
        return { value in
            value * step
        }
    }
    
    let times5 = curryedMultiplier(5)
    var result = times5(10) // 50
    result = times5(20) // 100
    
    let times10 = curryedMultiplier(10)
    result = times10(10) // 100
    result = times10(20) // 200
    
    /**
     Capturing
    */
    var test = "This is a test string"
    
    let f4: ()->Void = {
        debugPrint(test)
    }
    
    f4()
    test = "modified"
    f4()
}

// MARK: - Enums
enum Direction {
    case north
    case south
    case east
    case west
}

@objc enum Direction2: Int {
    case north
    case south
    case east
    case west
}

@objc enum Direction3: Int {
    case north = 1
    case south = 3
    case east = 9
    case west = 275
}

enum Direction4: String {
    case north
    case south
    case east
    case west
}

enum Direction5: String {
    case north = "North"
    case south = "South"
    case east = "East"
    case west = "West"
}

func testEnums() {
    debugPrint(Direction4.north.rawValue)
    debugPrint(Direction5.north.rawValue)
    
    let test = Direction.north
    switch test {
    case .north:
        break
    case .south:
        break
    case .east:
        break
    case .west:
        break
    }
}

/**
 Enums with associated types
 */
enum Route {
    
    case search(query: String, page: Int)
    case getArticles
    case createArticle(article: (String,String))
    
}

func associatedTypes(route: Route) {
    
    switch route {
    case let .search(query, page):
        debugPrint("\(query), \(page)")
    case .getArticles:
        break
    case .createArticle(let article):
        debugPrint(article)
    }
    
    if case let .search(query, page) = route {
        debugPrint("\(query), \(page)")
    }
    
    if case let .createArticle(article) = route {
        debugPrint(article)
    }
    
}

// MARK: - Structs
struct Result {
    let success: String?
    let error: Error?
}

struct Result2 {
    let success: String?
    let error: Error?
    
    init(success: String?) {
        self.success = success
        self.error = nil
    }
    
    init(error: Error?) {
        self.success = nil
        self.error = error
    }
    
    static func success(_ success: String?) -> Result2 {
        return Result2(success: success)
    }
}

struct Result3 {
    
    private(set) var success: String?
    private(set) var error: Error?
    
    init(success: String?, error: Error?) {
        self.success = success
        self.error = error
    }
    
    mutating func setSuccess(_ success: String) {
        self.success = success
    }
    
    mutating func setError(_ error: Error) {
        self.error = error
    }
}

func testStructs() {
    
    let result = Result(success: "Data", error: nil)
    
//    let result2 = Result2(success: "Success", error: nil) // Error
    let result2 = Result2.success("Data")
    
    var result3 = Result3(success: "Data", error: nil)
    var result4 = result3
    result3.setSuccess("Updated Data")
    
    debugPrint(result3.success)
    debugPrint(result4.success)
    debugPrint("value type")
}

// MARK: - Classes
class Shape {
    
    var origin: CGPoint
    
    init(origin: CGPoint) {
        self.origin = origin
    }
    
    func draw(inRect: CGRect) {
        // subclasses draw themselves here
    }
    
    deinit {
        debugPrint("Shape object was destroyed")
    }
}

class Rectangle: Shape {
    
    var height: CGFloat
    var width: CGFloat
    
    convenience init(height: CGFloat, width: CGFloat) {
        self.init(origin: .zero, height: height, width: width)
    }
    
    init(origin: CGPoint, height: CGFloat, width: CGFloat) {
        self.height = height
        self.width = width
        super.init(origin: origin)
    }
    
    override func draw(inRect: CGRect) {
        // TODO:
    }
}

class Circle: Shape {
    
    let radius: CGFloat
    
    convenience init(radius: CGFloat) {
        self.init(origin: .zero, radius: radius)
    }
    
    init(origin: CGPoint, radius: CGFloat) {
        self.radius = radius
        super.init(origin: origin)
    }
    
    override func draw(inRect: CGRect) {
        // TODO:
    }
}

func testClasses() {
    
    func translate(shape: Shape, dX: CGFloat, dY: CGFloat) {
        shape.origin.x += dX
        shape.origin.y += dY
    }
    
    let circle = Circle(radius: 50)
    debugPrint(circle.origin)
    translate(shape: circle, dX: 10, dY: -10)
    debugPrint(circle.origin)
    
    let circle1 = Circle(radius: 10)
    let circle2 = circle1
    
    if circle1 === circle2 {
        debugPrint("identical")
    }
    
    let shape1: Shape = circle
    let shape2 = circle as Shape
    let circle3 = shape1 as? Circle
    
    switch shape1 {
    case is Circle:
        break
    case let rect as Rectangle:
        debugPrint(rect)
    default:
        break
    }
    
    guard let circle4 = shape1 as? Circle else { return }
    debugPrint(circle4)
    
}

class Player {
    
    var firstName: String
    var lastName: String
    private(set) var score = 0
    private var rank = 0
    
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
//    func test() {
//        fullName = "failure"
//    }
    
    func updateScore(newScore: Int) {
        rank += 5
        score = newScore
    }
    
    class func newPlayer() -> Player {
        return Player(firstName: "Test", lastName: "Test")
    }
    
    static func newPlayerStatic() -> Player {
        return Player(firstName: "Test", lastName: "Test")
    }
    
}

class SubPlayer: Player {
    override class func newPlayer() -> Player {
        return Player(firstName: "Test", lastName: "Test")
    }
    
//    override static func newPlayerStatic() -> Player {
//        return Player(firstName: "Test", lastName: "Test")
//    }
}

class Player2 {
    
    static let instance = Player2(firstName: "Default", lastName: "Player")
    
    var firstName: String
    var lastName: String
    var score = 0 {
        didSet {
            rank += 5
        }
    }
    private var rank = 0
    
    private lazy var badge: String = {
        return "\(fullName)'s Badge"
    }()
    
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

// MARK: - Protocols

class Shape1: Drawable1 {
    
    var origin: CGPoint
    
    init(origin: CGPoint) {
        self.origin = origin
    }
    
    func draw(inRect: CGRect) {
        
    }
}

class Rectangle1: Shape1 {
    
}

class Circle1: Shape1 {
    
}

protocol Drawable1 {
    
    var origin: CGPoint { get set }
    
    func draw(inRect: CGRect)
}

/**
 Favor composition over inheritance
 */
protocol ListItem {
    var title: String { get }
    var subtitle: String? { get }
    var imageUrl: String? { get }
}

struct Painting: ListItem {
    let title: String
    let artist: String?
    let imageUrl: String?
    
    var subtitle: String? {
        return artist
    }
}

struct Book: ListItem {
    
    let title: String
    let author: String?
    let coverImageUrl: String?
    
    var subtitle: String? {
        return author
    }
    
    var imageUrl: String? {
        return coverImageUrl
    }
}

/**
 Delegation pattern
 */
class FileProcessor {
    
    weak var delegate: FileProcessorDelegate?
    
    func processFile(_ fileUrl: String) {
        
        delegate?.fileProcessor(self, willProcessFile: fileUrl)
        // process file 50%
        delegate?.fileProcessor(self, updateProgress: 0.5)
        // finish processing
        delegate?.fileProcessor(self, didFinishProcessingFile: fileUrl, withError: nil)
    }
}

protocol FileProcessorDelegate: class {
    func fileProcessor(_ fileProcessor: FileProcessor, willProcessFile fileUrl: String)
    func fileProcessor(_ fileProcessor: FileProcessor, updateProgress progress: Float)
    func fileProcessor(_ fileProcessor: FileProcessor, didFinishProcessingFile fileUrl: String, withError error: Error?)
}

// MARK: - Extensions

/**
 Basic
 */
extension String {
    
    private static let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    
//    private var emailPredicate: NSPredicate {
//        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
//    }

    func isValidEmail() -> Bool {
        return String.emailPredicate.evaluate(with: self)
    }
}

/**
 Code separation
 
 Given a JSON Article structure:
 {
     "headline": String,
     "author": {
        "firstName": String,
        "lastName": String
     },
     "text": String
 }
 */
struct Article2: Codable {
    let headline: String
    let author: Author2
    let text: String
}
struct Author2: Codable {
    let firstName: String
    let lastName: String
}

//-------------------------------

struct Article {
    
    var title: String
    var authorFullName: String
    var text: String
    
    enum CodingKeys: String, CodingKey {
        case title = "headline"
        case text
        case author
    }
    
    enum AuthorKeys: String, CodingKey {
        case firstName
        case lastName
    }
}

extension Article: Codable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        text = try values.decode(String.self, forKey: .text)
        
        let author = try values.nestedContainer(keyedBy: AuthorKeys.self, forKey: .author)
        let firstName = try author.decode(String.self, forKey: .firstName)
        let lastName = try author.decode(String.self, forKey: .lastName)
        authorFullName = "\(firstName) \(lastName)"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(title, forKey: .title)
        try container.encode(text, forKey: .text)
        
        var author = container.nestedContainer(keyedBy: AuthorKeys.self, forKey: .author)
        let split = authorFullName.split(separator: " ")
        try author.encode(String(split[0]), forKey: .firstName)
        try author.encode(String(split[1]), forKey: .lastName)
    }
}

/**
 Protocol extensions with type constraints
 */
protocol Observable {}
protocol Observer {
    func didChange(observable: Observable)
}
extension Observer where Self == MyObserver {
    func mySpecialFunction() -> Bool {
        return true
    }
}

class MyObserver: Observer {
    func didChange(observable: Observable) {
        self.mySpecialFunction()
    }
}

class MyObserver2: Observer {
    func didChange(observable: Observable) {
//        self.mySpecialFunction()
    }
}


// MARK: - ARC

/**
 Strong vs Weak
 */
class ConversationClass {
    
    private var messages = [MessageClass]()
    
    func add(message: MessageClass) {
        messages.append(message)
    }
}

class MessageClass {
    
    private var conversation: ConversationClass
    
    init(conversation: ConversationClass) {
        self.conversation = conversation
    }
}

func testRetainCycle() {
    var conv = ConversationClass()
    var msg = MessageClass(conversation: conv)
    conv.add(message: msg)
}

struct ConversationStruct {
    
    private var messages = [MessageStruct]()
    
    mutating func add(message: MessageStruct) {
        messages.append(message)
    }
}

struct MessageStruct {
    
    private var conversation: ConversationStruct
    
    init(conversation: ConversationStruct) {
        self.conversation = conversation
    }
}

func testRetainStructs() {
    var conv = ConversationStruct()
    var msg = MessageStruct(conversation: conv)
    conv.add(message: msg)
}

class ConversationClassWeak {
    
    private var messages = [MessageClassWeak]()
    
    func add(message: MessageClassWeak) {
        messages.append(message)
    }
}

class MessageClassWeak {
    
    private weak var conversation: ConversationClassWeak?
    
    init(conversation: ConversationClassWeak) {
        self.conversation = conversation
    }
}

func testRetainWeak() {
    var conv = ConversationClassWeak()
    var msg = MessageClassWeak(conversation: conv)
    conv.add(message: msg)
}

/**
 Closures
 */
class ClosureExample {
    
    private var counter = 0
    private var closure = {}
    
    init() {
        
        closure = {
            self.counter += 1
        }
        
        closure()
    }
}

class ClosureExampleList {
    
    private var counter = 0
    private var closure = {}
    
    init() {
        
        closure = { [counter] in
            var cp = counter
            cp += 1
        }
        
        closure()
    }
}

class ClosureExampleWeak {
    
    private var counter = 0
    private var closure = {}
    
    init() {
        
        closure = { [weak self] in
            self?.counter += 1
            debugPrint(self?.counter ?? "")
        }
        
        closure()
    }
}

// MARK: - Generics and Associated Types

/**
 Generics: Classes and Structs
 */
struct ResultStruct<Data> {
    let data: Data?
    let error: Error?
}

class ResultClass<Data> {
    let data: Data?
    let error: Error?
    
    init(data: Data?, error: Error?) {
        self.data = data
        self.error = error
    }
    
    class func success<T>(data: T) -> ResultClass<T> {
        return ResultClass<T>(data: data, error: nil)
    }
}

extension UIView {
    func findViewByTag<V:UIView>(_ tag: Int) -> V? {
        return self.viewWithTag(1) as? V
    }
}

/**
 Associated types: Protocols
 */
protocol ResultProtocol {
    
    associatedtype Data
    
    var data: Data? { get }
    var error: Error? { get }
}

struct StringResult: ResultProtocol {
    
    typealias Data = String
    
    let data: String?
    let error: Error?
}

/**
 Protocol extensions with type constraints on associated types
 */
extension Collection where Element == String {
    
    func mySpecialStringCollectionFunction() -> Bool {
        return true
    }
}

func testTypeConstraintsWithAssociatedTypes() {
    let collection = [String]()
    collection.mySpecialStringCollectionFunction()
}

// MARK: - Excercises

protocol Orderable {
    var id: String { get }
    var price: Float { get }
}
extension Orderable where Self: CaseIterable {
    static func randomItem() -> Self? {
        return Self.allCases.randomElement()
    }
}

enum Cafe: String, Orderable, CaseIterable {
    
    case espresso
    case latte
    case capuccino
    
    var id: String {
        return rawValue
    }
    
    var price: Float {
        switch self {
        case .espresso:
            return 1.99
        case .latte:
            return 2.50
        case .capuccino:
            return 3.50
        }
    }
}

enum Doughnut: String, Orderable, CaseIterable {
    
    case glazed
    case chocolate
    case sprinkles
    
    var id: String {
        return rawValue
    }
    
    var price: Float {
        switch self {
        case .glazed:
            return 1.0
        case .chocolate:
            return 1.25
        case .sprinkles:
            return 1.50
        }
    }
}

struct Order {
    
    let customer: Customer
    
    private(set) var items = [Orderable]()
    
    init(customer: Customer) {
        self.customer = customer
    }
    
    var total: Float {
        return items.reduce(0, { (acc, next) -> Float in
            return acc + next.price
        })
    }
    
    mutating func add(item: Orderable) {
        items.append(item)
    }
    
    mutating func remove(item: Orderable) {
        guard let itemIdx = items.firstIndex(where: { $0.id == item.id }) else { return }
        items.remove(at: itemIdx)
    }
}

class Customer {
    
    func payBarista(_ barista: Barista, order: Order) -> Float {
        return order.total
    }
}

class Barista {
    
    private(set) var earnings: Float = 0
    
    func process(order: Order, forClient client: Customer) {
        
        for item in order.items {
            switch item {
            case let cafe as Cafe:
                make(cafe: cafe)
            case let doughnut as Doughnut:
                make(doughnut: doughnut)
            default:
                break
            }
        }
        
        earnings += client.payBarista(self, order: order)
    }
    
    private func make(cafe: Cafe) {
        debugPrint("made cafe: \(cafe.rawValue)")
    }
    
    private func make(doughnut: Doughnut) {
        debugPrint("made doughnut: \(doughnut)")
    }
}

/**
 Exercise: Make the following compile
 */
func testExcercise1() {
    
    let barista = Barista()
    
    let client1 = Customer()
    var order1 = Order(customer: client1)
    
    let testItem: Orderable = Cafe.capuccino
    debugPrint("testItem: (\(testItem.id), \(testItem.price))")
    
    order1.add(item: testItem)
    order1.add(item: Cafe.espresso)
    order1.add(item: Doughnut.glazed)
    
    debugPrint("order1 total is: \(order1.total)")
    
    barista.process(order: order1, forClient: client1)
    
    let client2 = Customer()
    var order2 = Order(customer: client2)
    order2.add(item: Cafe.latte)
    order2.add(item: Doughnut.chocolate)
    order2.add(item: Doughnut.sprinkles)
    
    debugPrint("order2 total is: \(order2.total)")
    
    barista.process(order: order2, forClient: client2)
    
    let earnings = String(format: "%.02f", barista.earnings)
    debugPrint("Barista earned: \(barista.earnings)")
}

/**
 Bonus exercise: make the following compile
 */
func testExcercise2() {
    
    let barista = Barista()
    
    for i in 0..<10 {
        let c = Customer()
        var order = Order(customer: c)
        for j in 0..<Int.random(in: 1...5) {
            if let doughnut = Doughnut.randomItem() {
                order.add(item: doughnut)
            }
            if let cafe = Cafe.randomItem() {
                order.add(item: cafe)
            }
        }
        debugPrint("------------- Barista recieved a new order! -------------")
        barista.process(order: order, forClient: c)
    }
    
    debugPrint("------------- Coffe Shop is closed -------------")
    let earnings = String(format: "%.02f", barista.earnings)
    debugPrint("Barista earned: \(barista.earnings)")
}
