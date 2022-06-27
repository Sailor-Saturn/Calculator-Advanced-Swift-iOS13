 
import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (firstNumber: Double, operation: String)?
    
    mutating  func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let number = number {
            switch symbol {
            case "+/-":
                return number * -1
            case "AC":
                return 0
            case "%":
                return number * 0.01
            case "=":
                return performTwoCalculation(secondNumber: number)
            default: // sum operation
                intermediateCalculation = (firstNumber: number, operation: symbol)
            }
        }
        return number
    }
    
    private func performTwoCalculation(secondNumber: Double) -> Double?  {
        if let firstNumber = intermediateCalculation?.firstNumber,
           let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return firstNumber + secondNumber
            case "-":
                return firstNumber - secondNumber
            case "÷":
                return firstNumber/secondNumber
            default:
                return firstNumber * secondNumber
            }
        }
       return nil
    }
}
