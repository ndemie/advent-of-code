import Foundation

let days: [Day] = [DayOne(),
                   DayTwo(),
                   DayThree(),
                   DayFour(),
                   DayFive(),
                   DaySix()]

days.forEach({ $0.execute() })
