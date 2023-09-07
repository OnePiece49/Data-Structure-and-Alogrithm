class Sort {
    
    var arr = [87, 90, 85, 88, 86, 84, 92, 91]
    var countArr = [10, 15, 10, 4, 4, 20, 9, 25, 54, 4 ,10, 54, 9]
    
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


    func bubbleSort() {

        for key in 0 ..< arr.count {
            for i in 0 ..< arr.count - key - 1 {
                if arr[i] > arr[i+1] {
                    let temp = arr[i]
                    arr[i] = arr[i+1]
                    arr[i+1] = temp
                }
            }
        }
        
        printArr()    
    }

    func insertSort() {

        for key in 1 ..< arr.count {
            
            let currentValue = arr[key]
            var pop = key - 1
            
            while pop >= 0 && arr[pop] > currentValue {
                arr[pop + 1] = arr[pop]
                pop = pop - 1
            }
            
            arr[pop + 1] = currentValue
           
        }
        
        printArr()
    }

    func countingSort() {

        var tempArr = Array(repeating: 0, count: 1000001)

        guard let max = countArr.max() else {return}

       
        countArr.forEach { value in
            tempArr[value] += 1
        }
        

        for i in 0 ... max {
            if tempArr[i] != 0 {
                for _ in 0 ..< tempArr[i] {
                    print("DEBUG: \(i)")
                }
            }
        }
    } 


    func quickSort(_ arr: inout [Int], _ _left: Int, _ _right: Int) {        
        var left = _left
        var right = _right
        let centerX = left + (right - left) / 2
        let value = arr[centerX]


        while (left <= right) {
            while  arr[left] < value {
                left += 1
            }

            while arr[right] > value {
                right -= 1
            }

            if (left <= right) {
                let temp = arr[left]
                arr[left] = arr[right]
                arr[right] = temp
                left += 1
                right -= 1
            }
        }

        if left < _right {
            quickSort(&arr, left, _right)
        }


        if right > _left {
            quickSort(&arr, _left, right)
        }
    }
    
    
    func binarySearchC1(_ array: [Int] , _ n: Int) {
        let centerX = array.count / 2
        let centerValue = array[centerX]
        
        print("\(centerValue)")
        if centerValue == n {
            print("Position: \(centerX)")
            return
        }
        
        if array.count <= 1 {
            print("Position: -1")
            return
        }
        
        if centerValue < n {
            
            binarySearchC1(array.suffix(array.count - centerX), n)
        } 
        
        if centerValue > n {
            binarySearchC1( Array(array.prefix(centerX)), n)
        }
    }
    
    func binarySearch(_ arr: [Int], _ l: Int, _ r: Int, _ x: Int) {
        var left = l
        var right = r
        
        while (left <= right) {
            let centerX = left + (right - left) / 2
            let centerValue = arr[centerX]
            
            if centerValue == x {
                print("Pos: \(centerX)")
                return 
            }
            
            if centerValue > x {
                right = centerX - 1
            }
            
            if centerValue < x {
                left = centerX + 1
            }
        }
        
        print("Pos: -1")   
    }

    private func sinh_HV(_ arr: inout [Int]) -> Bool {
        
        var pos = arr.count - 1
        
        while arr[pos] < arr[pos - 1] && pos >= 0 {
            pos -= 1
        }
        
        for i in stride(from: arr.count - 1, to: pos - 1, by: -1) {
            if arr[pos - 1] < arr[i] {
                let temp = arr[pos - 1]
                arr[pos - 1] = arr[i]
                arr[i] = temp  
                break
            }        
        }       

        var l = pos
        var r = arr.count - 1
        
        while l <= r {
            let temp = arr[l]
            arr[l] = arr[r]
            arr[r] = temp
            l += 1
            r -= 1
        }
        
        for i in 0 ..< arr.count {
            if arr[i] != arr.count - i {return false}
        }
        
        return true
        
    }
    
    func sinh_hoan_vi(_ n: Int) {
        
        var arr = Array(repeating: 0, count: n)
        var isFinal = false
        
        for i in 0 ..< n {
            arr[i] = i + 1
        }
        
        while !isFinal {
            arr.forEach { value in
                print("\(value)", terminator: "")
            }
            
            print(",")
            
            isFinal = sinh_HV(&arr)
            
            if isFinal {
                arr.forEach { value in
                    print("\(value)", terminator: "")
                }                
            }
        }
        
    }
}

let sort = Sort()
sort.quickSort(&sort.arr, 0, sort.arr.count - 1)

// sort.binarySearchC1(sort.arr, 85)
sort.binarySearch(sort.arr, 0, 8, 90)
sort.sinh_hoan_vi(6)
