// Import
import Foundation

// This is the main function.
func main() {
    do {
        // Create and read the input file.
        let input = try String(contentsOfFile: "input.txt", encoding: .utf8)
        let inputLines = input.split(separator: "\n")

        // Create the output file.
        let output = FileHandle(forWritingAtPath: "output.txt")
        output?.truncateFile(atOffset: 0)

        // This loops each line in the file to the function
        for inputLine in inputLines {

            if let num = Int(inputLine), num >= 0 {

                // Function call
                let fibonacci = Fibonacci(num: num)

                // Print to the file
                let outputData = "\(fibonacci)\n".data(using: .utf8)
                output?.write(outputData!)

            } else {

                // Negative input number
                let errorMsg = "Error: The input number should be non-negative\n"
                let errorData = errorMsg.data(using: .utf8)
                output?.write(errorData!)
            }
        }

        // Close the writer
        output?.closeFile()

    } catch {
        // Display error
        print("Error: \(error.localizedDescription)")
    }
}

// This function calculates the Fibonacci of a number
func Fibonacci(num: Int) -> Int {
    // Base case
    if num == 0 {
        return 0;
    } else if num == 1 {
        return 1;
    } else {
        // Call the function recursively.
        return Fibonacci(num: num - 1) + Fibonacci(num: num - 2)
    }
}

main()
