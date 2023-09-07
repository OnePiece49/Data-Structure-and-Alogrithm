# Sinh Kế Tiếp

# I. Sinh Nhị Phân

Bài toán: Cho n = 3, liệt kê tất các các số nhị phân có 3 chữ số:

- Kết quả: 000, 001, 010, 011, 100, 101, 110, 111

Phương pháp làm: Ta cần biết
- Cấu hình đầu tiên
- Cấu hình cuối cùng 
- Phương pháp sinh

Các bước:

- Khởi tạo cấu hình đầu tiên
- While (<Khi chưa phải cấu hình cuối cùng>) {
    
    `In ra cấu hình hiện tại`

    `Sinh ra cấu hình tiếp theo` (Viết 1 function sinh())
}

```swift
private func sinh(_ array: inout [Int]) -> Bool {
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
        isFinal = sinh(&arr)
        
        if isFinal {
            arr.forEach { value in
                print("\(value)", terminator: "")
            }
        }
    }
    
    
}
```

# II. Sinh tập con

Bài toán: Cho 2 số `n = 5, k = 3`, ta cần sinh ra tổ hợp chập 3 của 5 

Output: `1,2,3`, `1,2,4`, `1,2,5`, `1,3,4`, `1,3,5`, `2,3,4`, `2,3,5`, `2,4,5`, `3,4,5`. Chú ý khi ta muốn sinh ra các số như `2,1,3`, `2,3,1`, thì đó là bài toán khác, gọi là `sinh hoán vị` và ta sẽ giải quyết ở phần `III`.

- Phần tử đầu tiên `1,2,...k`
- Phần tử cuối `n-k+1,n-k+2,...n-k+k`

Ta thấy quy luật ở đây sẽ là, ta sẽ kiểm tra phần tử cuối cùng xem đã là phần tử max chưa, nếu chưa max ta sẽ + 1(Ví dụ: 123, ta sẽ tăng lên 124, 125). Khi phần tử cuối đã max ta sẽ kiểm tra phần tử tiếp theo, khi thay đổi phần tử tiếp theo, ta phải thay đổi các phần tử đằng sau nó bằng cách tăng dần các số đứng sau lên 1 đơn vị (Ví dụ đang là 125, số tiếp theo là 134).

- Cơ bản cách làm vẫn là tìm phần tử đầu tiên, sau đó viết 1 func() để sinh ra phần tử kế tiếp. Và xác định phần tử cuối để ngừng sinh.

```swift
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
```

# III. Sinh hoán vị

Bài toán: Cho số nguyên dương n. Nhiệm vụ của bạn hãy liệt kê tất cả các hoán vị của 1,2,…,n.

Ví dụ: Cho n = 3. Output cần ra phải là `123, 132, 213, 231, 312, 321.`

- Phần tử đầu tiên `12...n`
- Phần tử cuối cùng `n,n-1,k-2,...1`
- Hàm sinh: Ta sẽ duyệt liên tiếp bằng cách khai báo biến `pos` có giá trị là `n-1`, so sánh phần tử đó với phần tử đứng ngay đằng trước(`pos - 1`). Nếu giá trị của `arr[pos]` mà bé hơn `arr[pos - 1]` thì `pos -= 1`, cứ làm thế cho đến khi `arr[pos]` > `arr[pos - 1]`. Khi đó ta sẽ swap giá trị của `arr[pos]` với giá trị bé nhất của của mảng trong khoảng `arr[pos + 1] cho đến arr[n-1]`, sau đó ta sẽ reverse đoạn từ `arr[pos+1] đến arr[n-1]`. Xem ví dụ dưới

Ví dụ: arr = `123 4765`, lúc này ta sẽ đổi chỗ số `4` và số `5`(vì `5` là min trong khoảng còn lại), sau đó reverse `674` thì ta được số mới là `123 5467`. Thế là ta đã lấy được số tiếp theo cần tìm.

```swift
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
```

# IV. Sinh phân hoạch

Bài toán: Cho số nguyên dương n. Viết tất cả các cách mà tổng các số < n cộng với nhau = n

Ví dụ: Cho n = 3. Ta có các cách: 3, 21, 111

- Phần tử đầu: n
- Phần tử cuối: 111...1 (n số 1)
- Hàm sinh: Ta sẽ sử dụng 1 biến `cnt` để đếm số phần tử hiện tại trong mảng. Và khai báo 1 biến `pos` có giá trị bằng `cnt - 1`. Ta sẽ duyệt các phần tử của mảng bắt đầu từ `pos`, phần tử nào có giá trị bằng `1` thì bỏ qua, khi gặp phần tử khác `1`, ta sẽ trừ phần tử đó đi 1 đơn vị, sau đó reset giá trị biến `cnt` bằng `pos`. Lúc này ta sẽ đếm xem đã bỏ quả bao nhiêu số `1` và + thêm 1 đơn vị vì đã giảm đi. Giả sử ta bỏ qua 3 biến có giá trị là `1`, thì lúc này ta khai báo biến `loss` có tổng còn thiếu `3 + 1 = 4`. Ta sẽ thêm các số đứng sau vào trong mảng bằng cách viết thêm `loss / arr[pos]` số `arr[pos]`. Cuối cùng ta sẽ viết thêm nốt số dư vào vị trí cuối cùng trong mảng và số đấy có giá trị là `loss % arr[pos]`. Xem ví dụ

Ví dụ: Ta có 12 = `5 4 1 1 1`. Lúc này khi gặp số 4 khác 1, ta sẽ viết lại mảng thành `5 3` và có `loss` = 4. Bây giờ ta phải gắn nốt số 4 vào trong mảng để tổng = 12. Ta sẽ viết thêm `4 / 3 = 1` số `3` vào trong mảng. Và viết lấy số cuối bằng cách lấy số dư là `4 % 3 = 1`. Cuối cùng ta được `5 3 3 1`.

```swift
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
```