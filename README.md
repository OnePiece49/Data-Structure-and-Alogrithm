
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

1. Selection Sort

Ta có 1 mảng `arr[] = [87, 90, 85, 88, 86, 84, 92, 91]`. Ý tưởng của `Selection Sort` đó là lần lượt lựa chọn các phần tử trong mảng, bắt đầu từ vị trí đầu tiên là 87, sau đó so sánh với phần tử tiếp thức, nếu phần tử nào có giá trị bé hơn sẽ đổi chỗ, output 1 phần các bước như sau:
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

# II. Search

<a name="Logarit"></a>
Ở đây ta muốn tìm 1 vị trí có giá trị bằng 85 trong mảng arr[] = [87, 90, 85, 88, 86, 84, 92, 91]