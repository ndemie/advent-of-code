import Foundation

public struct DaySix: Day {
    public var dayNumber = 6

    public init() {}

    public func execute() {
        let partOne = executePartOne()
        let partTwo = executePartTwo()
        printFormattedResult(partOne: partOne, partTwo: partTwo)
    }

    private func executePartOne() -> String {
        var foundMarkerIndex: Int?
        outerLoop: for (index, _) in input.enumerated() {
            guard input.count > index+4 else {
                continue
            }

            let possibleMarker = String(Array(input)[index..<index+4])
            for character in possibleMarker {
                if possibleMarker.filter({$0 == character}).count > 1 {
                    continue outerLoop
                }
            }

            foundMarkerIndex = index + 4
            break
        }

        return String(foundMarkerIndex ?? 0)
    }

    private func executePartTwo() -> String {
        var foundMarkerIndex: Int?
        outerLoop: for (index, _) in input.enumerated() {
            guard input.count > index+14 else {
                continue
            }

            let possibleMarker = String(Array(input)[index..<index+14])
            for character in possibleMarker {
                if possibleMarker.filter({$0 == character}).count > 1 {
                    continue outerLoop
                }
            }

            foundMarkerIndex = index + 14
            break
        }

        return String(foundMarkerIndex ?? 0)
    }
}
