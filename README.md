
# Data-Structure-and-Alogrithm

# I. Độ phức tạp thuật toán O(...)

`O(n)` ở đây đại diện cho số lượng câu lệnh phải thực hiện.

Ta thấy `O(n)` cũng tương tự như 1 hàm số `f(x)` nên `O(n) = an + b`, tuy nhiên trong giải thuật ta không quan tâm đến các số a và b nên sẽ là `O(n) = n`, và cũng tương tự cho `O(n^2) = n ^ 2`, `O(n^3) = n ^ 3`,... 
- Với n là độ lớn của dữ liệu, ví dụ ta có 1 Array có 8 phần tử thì n = 8.
- Ta thấy rằng khi n càng lớn, hoặc `bậc n` càng lớn thì độ lớn `O()` càng cao, dẫn đến số lượng câu lệnh phải thực hiện càng lớn. Vì vậy ta phải ưu tiên làm sao cho bậc của n càng lớn.

## 1.1 Độ phức tạp logarit
<p align="right">(<a href="Logarit">go to Logarit</a>)</p>

# II. Alogrithm

## I. Sort

Ta có 1 mảng `arr[] = [87, 90, 85, 88, 86, 84, 92, 91]`.

1. Selection Sort

Ý tưởng của `Selection Sort` đó là lần lượt lựa chọn các phần tử trong mảng, bắt đầu từ vị trí đầu tiên là 87, sau đó so sánh với phần tử tiếp thức, nếu phần tử nào có giá trị bé hơn sẽ đổi chỗ, output 1 phần các bước như sau:
- [`85`, 90, `87`, 88, 86, 84, 92, 91]: bắt đầu từ index = 0. Đổi 85 và 87
- [`84`, 90, 87, 88, 86, `85`, 92, 91]:  Đổi 85 và 84. Sau khi lần lựa chọn index = 0 đầu tiên, ta đã lấy ra được phần tử bé nhất và cho swab lên đầu. Ta cũng có thể ứng dụng bài toán này cho lựa chọn phần tử bé nhất.
- [84, `87`, `90`, 88, 86, 85, 92, 91]: Sau khi hết 1 vòng, tiếp tục từ index = 1. Đổi chỗ 90 và 87
- .....

```swift
func selectionSort() {
    
    for key in 0 ..< arr.count {    // N lần
        for i in key + 1 ..< arr.count {   // N - i
            if arr[key] > arr[i] {
                let temp = arr[key]
                arr[key] = arr[i]
                arr[i] = temp
            }
        }

    }
}
```

Ta có số lần chạy là: N * (N - i) = N ^ 2 - Ni. Nên với `Selection Sort` có độ phức tạp là `O(n^2)`.

2. BubbleSort Thuật toán nổi bọt 

Ý tưởng của `Buble Sort` là so sánh phần tử hiện tại với phần tử đứng sau nó, nếu phần tử hiện tại lớn hơn phần tử hiện tại sẽ swap 2 phần tử đó. Điều này sẽ đẩy được phần tử lớn nhất ra cuối mảng.

```swift
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
```

3. Insertion Sort Thuật toán sắp xếp chèn

Ý tưởng của `Insertion Sort` là chèn số sau vào dáy số đã được sắp xếp đằng trước.


Ta có mảng `arr[] = [87, 90, 85, 88, 86, 84, 92, 91]`. Thứ tự mảng đổi chỗ như sau:
- 85, 87, 90, 88, 86, 84, 92, 91
- 85, 87, 88, 90, 86, 84, 92, 91
- ....

```swift
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
```

4. Counting Sort - Thuật toán đếm phân phối

Ý tưởng của `Coungting Sort` là đếm số phân tử giống nhau xuất hiện trong mảng bằng cách sử dụng 1 mảng để key và value

VD: var arr = [10, 15, 10, 4, 4, 20, 9, 25, 54, 4 ,10, 54, 9]
Ta đếm thấy: 10 xuất hiện 3 lần, 15 xuất hiện 1 lần, 4 xuất hiện 3 lần,.. Lúc này mảng sẽ kiểu `lookup[10] = 3, lookup[15] = 1, lookup[4] = 3,...`

Chú ý: Vì mảng được khởi tạo có max size, thường là 1 mảng có tối đa 10^7(nếu khai báo mảng có size > 10 ^ 7 có thể gây ra tràn stack), nên cách giải này có 1 hạn chế là max value của mảng ko thể có giá trị > 10^7, và mảng phải có giá trị luôn dương vì đâu thể có key âm như `10[-5]` 

```swift
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
```

# II. Search

<a name="Logarit"></a>

2. Binary Search

Ta có 1 mảng `arr[] = [87, 90, 85, 88, 86, 84, 92, 91]`.

Ở đây ta muốn tìm 1 vị trí có giá trị bằng `85` trong mảng `arr[]`, trước tiên mảng `arr` cần được sắp xếp trước, sau đó ta sẽ lấy ra phần tử `center`, nếu `center` bằng phần tử cần tìm thì return phần tử đó luôn, ko thì so sánh phần tử `center` với giá trị cần tìm, nếu lớn hơn `center` thì lấy nửa phải, ko thì lấy nửa trái.

```swift
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
```