# What is Big O Notation?

Big O notation (aka Big O) is a way assessing the relative performance of a data structure or algorithm usually along two axis: time and space.

## Dominant Operations

The way we determine an algorithms Big O, is to look at the worse case performance of it's dominant operations.

### Constant time - O(1)

```swift
func constantTime(_ n: Int) -> Int {
    let result = n * n
    return result
}
```

Algorithms that don't do a lot of looping, or simply return the result of some simple calculation are said to have *constant time* or *O(1)*. Meaning these operations are very quick. 

### Linear time - O(n)

```swift
func linearTime(_ A: [Int]) -> Int {
    for i in 0..<A.count {
        if A[i] == 0 {
            return 0
        }
    }
    return 1
}
```

As soon as the performance of the algorithm becomes dependent on the size of the input being passed in, we can no longer say it is constant.

If the length of time it takes to process is a straight line, we refer to this is *linear time*. Meaning the the length of time it takes is directly proportional to the size of the input.

> Note: Even though the loop could return immediately if the first value of the array is `0`, when evaluating Big O we always look for worst case performance. That's when this is still O(n) with a best case of O(1).

### Logarithmic time - O(log n)

```swift
func logarithmicTime(_ N: Int) -> Int {
    var n = N
    var result = 0
    while n > 1 {
        n /= 2
        result += 1
    }
    return result
}
```

Algorithms like BSTs (Binary Search Trees) are extremely fast because they half their results each time they look for a result. This halfing is logarithmic which we refer to as *O(log n)*.

### Quadratic time - O(n^2)

```swift
func quadratic(_ n: Int) -> Int {
    var result = 0
    for i in 0..<n {
        for j in i..<n {
            result += 1
            print("\(i) \(j)")
        }
    }
    return result
}
```

When you embed one for loop within another, you get a quadratic effect applied to your algorithm which can really slow things down. These are OK for getting the right answer, they just aren't the most performant.

When you compare these operations on a [graph](https://www.bigocheatsheet.com/), you start to get a good feel for their relative performance.

![](images/cheat.png)

Algorithms that fall into the lower right (O(1), O(logn)) are considered very good. Linear time O(n) isn't bad. But anything above that isn't considered very performant, like O(n^2).



