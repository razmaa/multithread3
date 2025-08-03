import Foundation

let operationQueue = OperationQueue()

let operationA = BlockOperation {
    print("Operation \"A\" started")
    for _ in 0..<1_000_000 {
        
    }
    print("Operation \"A\" finished")
}

let operationB = BlockOperation {
    print("Operation \"B\" started")
    for _ in 0..<1_000_000 {
        
    }
    print("Operation \"B\" finished")
}

operationB.addDependency(operationA)

operationA.completionBlock = {
    operationB.cancel()
}

operationQueue.addOperations([operationB, operationA], waitUntilFinished: true)
