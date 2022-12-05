import Foundation

let days: [Day] = [DayOne(),
                   DayTwo(),
                   DayThree(),
                   DayFour(),
                   DayFive()]

days.forEach({ $0.execute() })
