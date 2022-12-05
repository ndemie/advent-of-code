import Foundation

public struct DayThree: Day {
    public var dayNumber = 3

    public init() {}

    public func execute() {
        let partOne = executePartOne()
        let partTwo = executePartTwo()
        printFormattedResult(partOne: partOne, partTwo: partTwo)
    }

    private func executePartOne() -> String {
        let bags = input.components(separatedBy: "\n")

        let splitBags = bags.map { bag in
            let halfLength = bag.count / 2
            let firstCompartment = bag[bag.startIndex..<String.Index(utf16Offset: halfLength, in: bag)]
            let secondCompartment = bag[String.Index(utf16Offset: halfLength, in: bag)..<bag.endIndex]
            return (firstCompartment, secondCompartment)
        }

        let duplicateItems = splitBags.compactMap { (firstCompartment, secondCompartment) in
            return firstCompartment.first(where: {secondCompartment.contains($0)})
        }

        let alphabet: [Character] = (0..<26).compactMap { index in
            guard let firstIndex = "a".unicodeScalars.first?.value,
                  let scalar = UnicodeScalar(Int(firstIndex) + index) else {
                return nil
            }

            return Character(scalar)
        }

        let priorityCount = duplicateItems.compactMap { item in
            let priority = alphabet.firstIndex(of: Character(item.lowercased()))
            guard let priority = priority else {
                return nil
            }
            return item.isUppercase ? priority + 27 : priority + 1
        }.reduce(0, +)

        return String(priorityCount)
    }

    private func executePartTwo() -> String {
        let bags = input.components(separatedBy: "\n")

        let groupedBags = bags.chunked(into: 3)
        let duplicateItems = groupedBags.compactMap { group in
            let groupCharacters = group.map { bag in
                return Array(Set(bag))
            }.reduce([], +)
            var countDictionary = [Character: Int]()

            for item in groupCharacters {
                countDictionary[item] = (countDictionary[item] ?? 0) + 1
            }

            return countDictionary.first(where: {$0.value == 3})?.key
        }

        let alphabet: [Character] = (0..<26).compactMap { index in
            guard let firstIndex = "a".unicodeScalars.first?.value,
                  let scalar = UnicodeScalar(Int(firstIndex) + index) else {
                return nil
            }

            return Character(scalar)
        }

        let priorityCount = duplicateItems.compactMap { item in
            let priority = alphabet.firstIndex(of: Character(item.lowercased()))
            guard let priority = priority else {
                return nil
            }
            return item.isUppercase ? priority + 27 : priority + 1
        }.reduce(0, +)

        return String(priorityCount)
    }
}
