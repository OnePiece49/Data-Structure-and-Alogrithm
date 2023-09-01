import UIKit


class Sort {
    
    var arr = [87, 90, 85, 88, 86, 84, 92, 91]
    
    func printArr() {
        arr.forEach { value in
            print("DEBUG: \(value)")
        }
    }
    
    func selectionSort() {
        
        for key in 0 ..< arr.count {
            for i in key + 1 ..< arr.count {
                if arr[key] > arr[i] {
                    let temp = arr[key]
                    arr[key] = arr[i]
                    arr[i] = temp
                }
            }

        }
        
        printArr()
    }
    
    
    
}

Sort().selectionSort()

