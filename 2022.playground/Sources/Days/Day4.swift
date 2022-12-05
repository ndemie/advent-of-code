import Foundation

public struct DayFour: Day {
    public var dayNumber = 4

    public init() {}

    public func execute() {
        let partOne = executePartOne()
        let partTwo = executePartTwo()
        printFormattedResult(partOne: partOne, partTwo: partTwo)
    }

    private func executePartOne() -> String {
        let sectionPairs = input.components(separatedBy: "\n").map { section in
            return section.components(separatedBy: ",")
        }

        let dividedSectionPairs = sectionPairs.map { sectionPair in
            return sectionPair.map { section in
                return section.components(separatedBy: "-").compactMap { item in
                    return Int(item)
                }
            }
        }

        var fitCount = 0

        for pair in dividedSectionPairs {
            guard let firstPair = pair.first,
                  let secondPair = pair.last,
                  let firstPairLowerBound = firstPair.first,
                  let firstParUpperBound = firstPair.last,
                  let secondPairLowerBound = secondPair.first,
                  let secondPairUpperBound = secondPair.last else {
                continue
            }

            let firstPairRange = firstPairLowerBound..<firstParUpperBound
            let secondPairRange = secondPairLowerBound..<secondPairUpperBound

            guard firstPairRange.clamped(to: secondPairRange) == firstPairRange || secondPairRange.clamped(to: firstPairRange) == secondPairRange else {
                continue
            }

            fitCount += 1
        }

        return String(fitCount)
    }

    private func executePartTwo() -> String {
        let sectionPairs = input.components(separatedBy: "\n").map { section in
            return section.components(separatedBy: ",")
        }

        let dividedSectionPairs = sectionPairs.map { sectionPair in
            return sectionPair.map { section in
                return section.components(separatedBy: "-").compactMap { item in
                    return Int(item)
                }
            }
        }

        var fitCount = 0

        for pair in dividedSectionPairs {
            guard let firstPair = pair.first,
                  let secondPair = pair.last,
                  let firstPairLowerBound = firstPair.first,
                  let firstParUpperBound = firstPair.last,
                  let secondPairLowerBound = secondPair.first,
                  let secondPairUpperBound = secondPair.last else {
                continue
            }

            let firstPairRange = firstPairLowerBound...firstParUpperBound
            let secondPairRange = secondPairLowerBound...secondPairUpperBound

            guard firstPairRange.overlaps(secondPairRange) else {
                continue
            }

            fitCount += 1
        }

        return String(fitCount)
    }
}
