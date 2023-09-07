class Sinh {

    private func sinh_NP(_ array: inout [Int]) -> Bool {
        var i = array.count - 1
        
        while true {
            if array[i] == 0 {
                array[i] = 1
                break
            } else if array[i] == 1 {
                array[i] = 0
                i -= 1
            }
        }
        
        for i in 0 ..< array.count {
            if array[i] != 1 {return false}
        }
        
        return true
    }
    
    func sinh_nhi_phan(_ n: Int) {
        
        if n == 0 {return}
        
        var arr = Array(repeating: 0, count: n)
        var isFinal = false
        
        while !isFinal {
            arr.forEach { value in
                print("\(value)", terminator: "")
            }
            
            print(", ")
            isFinal = sinh_NP(&arr)
            
            if isFinal {
               arr.forEach { value in
                    print("\(value)", terminator: "")
                }
            }
        }
    }
    
    func sinh_TH(_ arr: inout [Int], _ n: Int, _ k: Int) -> Bool {
        
        var pos = k - 1
        var check = k
        while arr[pos] >= n + k - check && pos >= 0 {
            pos -= 1
            check += 1
        }
        
        arr[pos] += 1
        
        if pos != k - 1 {
            for i in (pos + 1) ... k - 1 {
                arr[i] = arr[pos] + i - pos
            }
        }
        
        for i in 0 ..< k  {
            if arr[i] != n - k + i + 1 {return false}
        }
        
        return true

    }
    
    func sinh_to_hop(n: Int, k: Int) {
        var arr = Array(repeating: 0, count: k)
        
        for i in 0 ..< arr.count {
            arr[i] = i + 1
        }
        
        var isFinal = false
        
        while !isFinal {
            arr.forEach { value in
                print("\(value)", terminator: "")
            }
            
            print(",")
            isFinal = sinh_TH(&arr, n, k)
            
            if isFinal {
                arr.forEach { value in
                    print("\(value)", terminator: "")
                }                
            }

        }
        
    }    
    
    private func sinh_PH(_ arr: inout [Int], _ cnt: inout Int, _ n: Int) -> Bool {
        
        var pos = cnt - 1
        
        while arr[pos] == 1 && pos >= 0 {
            pos -= 1
        }
        
        let loss = cnt - pos
        cnt = pos + 1        //Reset cnt
        arr[pos] -= 1   
       
        
        let time = loss / arr[pos]
        let last = loss % arr[pos]
        
        for i in 0 ..< time {
            arr[pos + i + 1] = arr[pos]
            cnt += 1
        }
        
        if last != 0 {
            arr[pos + time + 1] = last
            cnt += 1           
        }

        
        for i in 0 ..< n {
            if arr[i] != 1 {return false}
        }
        
        return true
    }
    
    func sinh_phan_hach(_ n: Int) {
        
        if n == 1 {
            print("1")
            return
        }
        
        var arr = Array(repeating: 0, count: n)
        var isFinal = false
        var cnt = 1
        arr[0] = n
        
        while !isFinal {
            for i in 0 ..< cnt {
                print("\(arr[i])", terminator: "")
            }
            
            print(",")
            
            isFinal = sinh_PH(&arr, &cnt, n)
            
            if isFinal {
                for i in 0 ..< cnt {
                    print("\(arr[i])", terminator: "")
                }              
            }
        }
        
    }


    
}

let sinh = Sinh()
// sinh.sinh_nhi_phan(2)
sinh.sinh_to_hop(n: 8, k: 3)
sinh.sinh_phan_hach(8)

