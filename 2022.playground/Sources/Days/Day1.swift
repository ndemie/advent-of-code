import Foundation

public struct DayOne: Day {
    public var dayNumber = 1

    public init() {}

    public func execute() {
        let partOne = executePartOne()
        let partTwo = executePartTwo()
        printFormattedResult(partOne: partOne, partTwo: partTwo)
    }

    private func executePartOne() -> String {
        let elvesFoodStrings = input.components(separatedBy: "\n\n")
        let elvesFoodArrays = elvesFoodStrings.map { string in
            return string.components(separatedBy: "\n")
        }

        let elvesStackedArrays = elvesFoodArrays.map { items in
            return items.compactMap { item in
                return Int(item)
            }.reduce(0, +)
        }

        let biggestElfInventory = elvesStackedArrays.max()
        return String(biggestElfInventory ?? 0)
    }

    private func executePartTwo() -> String {
        let elvesFoodStrings = input.components(separatedBy: "\n\n")
        let elvesFoodArrays = elvesFoodStrings.map { string in
            return string.components(separatedBy: "\n")
        }

        let elvesStackedArrays = elvesFoodArrays.map { items in
            return items.compactMap { item in
                return Int(item)
            }.reduce(0, +)
        }

        let sortedElvesInventory = elvesStackedArrays.sorted(by: {$0 > $1})
        let topThreeInventories = Array(sortedElvesInventory.prefix(3))
        let totalTopThreeCalorieCount = topThreeInventories.reduce(0, +)

        return String(totalTopThreeCalorieCount)
    }
}
