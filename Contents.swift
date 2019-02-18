import UIKit

//
extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview(_:))
    }
}

//
extension UILabel {
    static func initForTitle() -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.75
        return label
    }
}

//
extension UIColor {
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(r: (hex >> 16) & 0xff, g: (hex >> 8) & 0xff, b: hex & 0xff)
    }
}

//
let digits = [1, 4, 10, 15]
let even = digits.filter{ $0 % 2 == 0 }
print(even)

let cast = ["Vivian", "Marlon", "Kim", "Karl"]
let shortNames = cast.filter{ $0.count < 5 }
print(shortNames)

//
let numbers = [1, 2, 3, 4, 5, -4, 2, 4]
if let firstNegative = numbers.first(where: { $0 < 0 }) {
    print(firstNegative)
}

//
let names = ["fdsaf", "fdsafds", "gfdsg", "trewt", "bgdfs", "kuymkjg"]
let allHaveAtLeastFive = names.allSatisfy { $0.count >= 5 }
print(allHaveAtLeastFive)

//
func simpleDefer() {
    defer {
        print("End of this function")
    }
    print("Main body of the simpleDefer function")
}
simpleDefer()

//
var number = 12

func  changeNumber(localNumber: inout Int) {
    localNumber += 3
}

changeNumber(localNumber: &number)
print(number)

//
let cast2 = ["Vivian", "Marlon", "Kimdajie", "Karl"]
let lowercaseNames = cast2.map{ $0.lowercased() }
print(lowercaseNames)
let letterCounts = cast2.map{ $0.count }
print(letterCounts)

//
let possibleNumbers = ["1", "2", "three", "///4///", "5", "fish"]
let mapped = possibleNumbers.map{ Int($0) }
print(mapped)
let compactMapped = possibleNumbers.compactMap{ Int($0) }
print(compactMapped)

//
let array = [3, 9, 1, 4, 6, 2]
let sorted = array.sorted(by: > )
print(sorted)

//
infix operator ∈
func ∈ <T: Equatable>(lhs: T, rhs: [T]) -> Bool {
    return rhs.contains(lhs)
}

let month = "September"
if month ∈ ["April", "June", "September", "November"] {
    print("\(month) has 30 days")
}

//
enum CompassDirection: CaseIterable {
    case north, south, east, west
}

print("There are \(CompassDirection.allCases.count) directions")

for direction in CompassDirection.allCases {
    print("I want to go \(direction)")
}

//
var numbers2 = [1, 2, 3, 4, 5, 6]
let shuffledNumbers = numbers2.shuffled()
print(shuffledNumbers)
print(numbers2)
numbers2.shuffle()
print(numbers2)

//
func saveToDisk(force: Bool = false) {
}
saveToDisk()
saveToDisk(force: true)

//
@discardableResult
func bumpUp() -> Int {
    return 0
}

//
func calculateStatistics(scrores: [Int]) -> (min: Int, max: Int, sum: Int) {
    guard let min = scrores.min(), let max = scrores.max() else {
        fatalError("score is nil")
    }
    let sum = scrores.reduce(0) { $0 + $1 }
    return (min, max, sum)
}

let statistics = calculateStatistics(scrores: [5, 3, 100, 3, 9])
print(statistics)
print(statistics.2)

//
struct Bank {
    public private(set) var address: String
}

let bank = Bank(address: "My Address")
print(bank.address)
//bank.address = "Kraim"

//
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

//
let names2 = ["Jack", "Frank", "Jim", "Wrappers"]
let nameString = names2.joined()
let nameStringBySeparator = names2.joined(separator: ",")
print(nameStringBySeparator)
let nameArray = nameStringBySeparator.split(separator: ",")
print(nameArray)

//
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer. "
}
print(description)

//
func swapTwoValues<T> (a: inout T, b: inout T) {
    let tempValue = a
    a = b
    b = tempValue
}

var someInt = 3
var anotherInt = 107
print("someInt is \(someInt), anotherInt is \(anotherInt)")
swapTwoValues(a: &someInt, b: &anotherInt)
print("someInt is \(someInt), anotherInt is \(anotherInt)")

//
var firstVariable = 5
var secondVariable = 10

print(firstVariable)
print(secondVariable)

(firstVariable, secondVariable) = (secondVariable, firstVariable)

print(firstVariable)
print(secondVariable)

//
protocol Builder{}

extension Builder {
    //Self代表这个类型，self代表具体的值
    func with(configure: (inout Self) -> Void) -> Self {
        var this = self
        configure(&this)
        return this
    }
}

extension NSObject: Builder {}

private let tableView = UITableView.init(frame: .zero, style: .plain).with { (tableView) in
    tableView.backgroundColor = .white
    tableView.separatorColor = .darkGray
    tableView.allowsMultipleSelection = true
}

//
let quotation = """
aaaaa,
bbbbb,
ccccc.
"""
print(quotation)

//
let three = 3
let minusThree = -three
let plusThree = -minusThree
print(minusThree)

//
let number1 = 1024
let divisionByTwo = number1 >> 1
let multiplyByTwo = number << 1

//？？？？？？
@dynamicMemberLookup
struct DynamicStruct {
    let dictionary = ["someDynamicMember": 325, "someOtherMember": 787]
    
    subscript(dynamicMember member: String) -> Int {
        return dictionary[member] ?? 1054
    }
}
let s = DynamicStruct()

let dynamic = s.someDynamicMember
print(dynamic)

let equivalent = s[dynamicMember: "someDynamicMember"]
print(dynamic == equivalent)

//
struct Point {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

//
DispatchQueue.global(qos: .userInteractive).async {
    print(Thread.isMainThread)
}

//
let dispatchGroup = DispatchGroup()
dispatchGroup.enter()
dispatchGroup.leave()

dispatchGroup.enter()
dispatchGroup.leave()

dispatchGroup.notify(queue: .main) {
    print("notify")
}

//
let sharedURLSession = URLSession.shared
let standardUserDedaults = UserDefaults.standard

class NetworkManager {
    static let shared = NetworkManager(baseURL: URL.init(string: "xxxxxx")!)
    
    let baseURL: URL
    
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
}

NetworkManager.shared

//
protocol Jumping {
    func jump()
}

class Cat: Jumping {
    func jump() {
        print("Pounces")
    }
}

class Frog {
    func leap() {
        print("Leaps")
    }
}

class FrogAdapter: Jumping {
    let frog = Frog()
    
    func jump() {
        frog.leap()
    }
}

let cat = Cat()
let frog = FrogAdapter()
let animals: [Jumping] = [cat, frog]

for animal in animals {
    print(animal.jump())
}

//
protocol Human {
    var humanName: String { get set }
    func run()
    func eat()
    func sleep()
}

class Soldier: Human {
    var humanName: String
    
    init(soldierName: String) {
        self.humanName = soldierName
    }
    
    func run() {}
    
    func eat() {}
    
    func sleep() {}
}

class Civilian: Human {
    var humanName: String
    
    init(civilianName: String) {
        self.humanName = civilianName
    }
    
    func run() {}
    
    func eat() {}
    
    func sleep() {}
}

enum HumanType {
    case soldier
    case civilian
}

class HumanFactory {
    static let shared = HumanFactory()
    
    func getHuman(type: HumanType, name: String) -> Human {
        switch type {
        case .soldier:
            return Soldier(soldierName: name)
        case .civilian:
            return Civilian(civilianName: name)
        }
    }
}

let soldier = HumanFactory.shared.getHuman(type: .soldier, name: "Jay")
let civilian = HumanFactory.shared.getHuman(type: .civilian, name: "Saman")

//
protocol Fly {
    func fly()
}

class Bird: Fly {
    func fly() {
        print("Spread Wings")
    }
}

class Plane: Fly {
    func fly() {
        print("Start Engine")
    }
}

let flyObj: Fly = Bird()
print(flyObj.fly())

//????? 58
//protocol Observer {
//    var id: Int { get }
//    fun update<ObservableValue>(with newValue: ObservableValue)
//}
//
//protocol Observable {
//    associatedtype ObservableValue
//    var value: ObservableValue { get set }
//    var observers: [Observer] { get set }
//
//    func addObserver(observer: Observer)
//    func removeObserver(observer: Observer)
//    func notifyAllObservers<ObservableValue>(with newValue: ObservableValue)
//}

//
extension CALayer {
    func  applySketchShadow(color: UIColor = .black, alpha: Float = 0.5, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        if spread == 0 {
            
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

//
struct Person {
    var first: String
    var last: String
}

extension Person {
    init(dictionary: [String: String]) {
        self.first = dictionary["first"] ?? "Emma"
        self.last = dictionary["last"] ?? "Stone"
    }
}

//
protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol { }

UIView.className
UILabel().className

//
public extension UITableView {
    public func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    public func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach {
            register(cellType: $0, bundle: bundle)
        }
    }
    
    public func dequeueReuesableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}

//?????75

//
public extension Array where Element: Equatable {
    @discardableResult
    public mutating func remove(element: Element) -> Index? {
        guard let index = firstIndex(of: element) else { return nil }
        remove(at: index)
        return index
    }
    
    @discardableResult
    public mutating func remove(elements: [Element]) -> [Index] {
        return elements.compactMap { remove(element: $0) }
    }
}

var array2 = ["foo", "bar"]
array2.remove(element: "foo")
array2

//
public extension Array where Element: Hashable {
    public mutating func unify() {
        self = unified()
    }
}

public extension Collection where Element: Hashable {
    public func unified() -> [Element] {
        return reduce(into: [] ) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
}

var array3 = [1, 2, 3, 3, 2, 1, 4]
array3.unify()

//
