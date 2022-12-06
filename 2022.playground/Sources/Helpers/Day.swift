import Foundation


public protocol Day {
    var dayNumber: Int { get }
    func execute()
}

public extension Day {
    func printFormattedResult(partOne: String?, partTwo: String?) {
        let result = """
        Day \(dayNumber)
        Part 1: \(partOne ?? "TODO")
        Part 2: \(partTwo ?? "TODO")
        ----
        """

        print(result)
    }

    var input: String {
        let fileURL = Bundle.main.url(forResource: "input-\(self.dayNumber)", withExtension: "txt")
        let input = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
        return input
    }
}
