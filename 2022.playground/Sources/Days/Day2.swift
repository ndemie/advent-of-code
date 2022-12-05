import Foundation

public struct DayTwo: Day {
    public var dayNumber = 2

    enum Move: Int, CaseIterable {
        case rock = 1
        case paper = 2
        case scissors = 3

        init?(characterValue: Character?) {
            switch characterValue {
            case "A", "X":
                self = .rock
            case "B", "Y":
                self = .paper
            case "C", "Z":
                self = .scissors
            default:
                return nil
            }
        }

        func getResult(otherMove: Move) -> Result {
            switch (self, otherMove) {
            case (.rock, .paper):     return .win
            case (.rock, .scissors):  return .lose
            case (.paper, .rock):     return .lose
            case (.paper, .scissors): return .win
            case (.scissors, .rock):  return .win
            case (.scissors, .paper): return .lose
            default:                  return .draw
            }
        }
    }

    enum Result: Int {
        case lose = 0
        case draw = 3
        case win = 6

        init?(characterValue: Character?) {
            switch characterValue {
            case "X":
                self = .lose
            case "Y":
                self = .draw
            case "Z":
                self = .win
            default:
                return nil
            }
        }
    }

    struct Game {
        let elfMove: Move
        let myMove: Move

        private func getResult() -> Result {
            switch (elfMove, myMove) {
            case (.rock, .paper):     return .win
            case (.rock, .scissors):  return .lose
            case (.paper, .rock):     return .lose
            case (.paper, .scissors): return .win
            case (.scissors, .rock):  return .win
            case (.scissors, .paper): return .lose
            default:                  return .draw
            }
        }

        func getPart1Points() -> Int {
            let gamePoints = getResult().rawValue
            let movePoints = myMove.rawValue

            return gamePoints + movePoints
        }

        func getPart2Points() -> Int {
            let gamePoints = elfMove.getResult(otherMove: myMove).rawValue
            let movePoints = myMove.rawValue

            return gamePoints + movePoints
        }
    }

    public init() {}

    public func execute() {
        let partOne = executePartOne()
        let partTwo = executePartTwo()
        printFormattedResult(partOne: partOne, partTwo: partTwo)
    }

    private func executePartOne() -> String {
        let gameStrings = input.components(separatedBy: "\n")
        let games = gameStrings.compactMap { gameString -> Game? in
            guard let elfMove = Move(characterValue: gameString.first),
                  let myMove = Move(characterValue: gameString.last) else {
                return nil
            }

            return Game(elfMove: elfMove, myMove: myMove)
        }

        let totalPoints = games.map { game in
            return game.getPart1Points()
        }.reduce(0, +)

        return String(totalPoints)
    }

    private func executePartTwo() -> String {
        let gameStrings = input.components(separatedBy: "\n")
        let games = gameStrings.compactMap { gameString -> Game? in
            guard let elfMove = Move(characterValue: gameString.first),
                  let wantedResult = Result(characterValue: gameString.last) else {
                return nil
            }

            var myMove: Move?
            for move in Move.allCases {
                if elfMove.getResult(otherMove: move) == wantedResult {
                    myMove = move
                    break
                }
            }

            guard let myMove = myMove else {
                return nil
            }

            return Game(elfMove: elfMove, myMove: myMove)
        }

        let totalPoints = games.map { game in
            return game.getPart2Points()
        }.reduce(0, +)

        return String(totalPoints)
    }
}

