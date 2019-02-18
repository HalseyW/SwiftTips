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

