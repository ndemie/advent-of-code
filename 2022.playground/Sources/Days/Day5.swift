import Foundation

public struct DayFive: Day {
    public var dayNumber = 5

    public init() {}

    public func execute() {
        let partOne = executePartOne()
        let partTwo = executePartTwo()
        printFormattedResult(partOne: partOne, partTwo: partTwo)
    }

    private func executePartOne() -> String {
        let splittedInput = input.components(separatedBy: "\n\n")
        let crates = splittedInput.first!
        let lines = crates.components(separatedBy: "\n").filter({$0.contains("[")})
        let formattedLines = lines.map { line in
            return line.inserting(separator: "-", every: 4).components(separatedBy: "-").compactMap { item -> String? in
                let trimmedString = item.trimmingCharacters(in: CharacterSet(charactersIn: " []"))
                return trimmedString
            }
        }

        var stacks = [[String]]()
        for line in formattedLines.reversed() {
            for (index, crate) in line.enumerated() {
                if stacks.count < index + 1 {
                    stacks.append([])
                }

                guard !crate.isEmpty else {
                    continue
                }

                stacks[index].append(crate)
            }
        }

        var instructions = splittedInput.last!.components(separatedBy: "\n")
        instructions.removeAll(where: {$0.isEmpty})

        for instruction in instructions {
            let moves = instruction.components(separatedBy: " ").compactMap { partialInstruction in
                return Int(partialInstruction)
            }

            let amount = moves[0]
            let from = moves[1]-1
            let to = moves[2]-1

            for _ in 1...amount {
                guard !stacks[from].isEmpty else {
                    continue
                }

                stacks[to].append(stacks[from].removeLast())
            }
        }

        let topCrates = stacks.compactMap { stack in
            return stack.last
        }.joined()

        return topCrates
    }

    private func executePartTwo() -> String {
        let splittedInput = input.components(separatedBy: "\n\n")
        let crates = splittedInput.first!
        let lines = crates.components(separatedBy: "\n").filter({$0.contains("[")})
        let formattedLines = lines.map { line in
            return line.inserting(separator: "-", every: 4).components(separatedBy: "-").compactMap { item -> String? in
                let trimmedString = item.trimmingCharacters(in: CharacterSet(charactersIn: " []"))
                return trimmedString
            }
        }

        var stacks = [[String]]()
        for line in formattedLines.reversed() {
            for (index, crate) in line.enumerated() {
                if stacks.count < index + 1 {
                    stacks.append([])
                }

                guard !crate.isEmpty else {
                    continue
                }

                stacks[index].append(crate)
            }
        }

        var instructions = splittedInput.last!.components(separatedBy: "\n")
        instructions.removeAll(where: {$0.isEmpty})

        for instruction in instructions {
            let moves = instruction.components(separatedBy: " ").compactMap { partialInstruction in
                return Int(partialInstruction)
            }

            let amount = moves[0]
            let from = moves[1]-1
            let to = moves[2]-1

            let cratesToBeMoved = stacks[from].reversed()[0..<amount]

            for _ in 1...moves[0] {
                guard !stacks[from].isEmpty else {
                    continue
                }

                stacks[from].removeLast()
            }

            stacks[to].append(contentsOf: cratesToBeMoved.reversed())
        }

        let topCrates = stacks.compactMap { stack in
            return stack.last
        }.joined()

        return topCrates
    }
}
