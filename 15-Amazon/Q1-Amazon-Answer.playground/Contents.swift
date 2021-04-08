import Foundation
import XCTest

/*
   _
  /_\  _ __  __ _ ______ _ _
 / _ \| '  \/ _` |_ / _ \ ' \
/_/ \_\_|_|_\__,_/__\___/_||_|

 Write an algorithm that merges these two arrays into one.
 
 */

func merge(_ L1: [Int], _ L2: [Int]) -> [Int] {
    var result = [Int]()
    
    var i = 0
    var j = 0
    
    // Merge the full length of on list
    while i < L1.count && j < L2.count {
        if L1[i] <= L2[j] {
            result.append(L1[i])
            i += 1
        } else {
            result.append(L2[j])
            j += 1
        }
    }
    
    // Copy remaining elements of L1
    while i < L1.count {
        result.append(L1[i])
        i += 1
    }

    // Copy remaining elements of L2
    while j < L2.count {
        result.append(L2[j])
        j += 1
    }

    return result
}



class Tests: XCTestCase {

    func testMerge() {
        let expected = [1, 2, 3, 5, 5, 7, 8, 11, 14]
        let actual = merge([1, 3, 5, 7], [2, 5, 8, 11, 14])
        XCTAssertEqual(expected, actual)
    }
 
    func testL1Empty() {
        let expected = [2, 5, 8, 11, 14]
        let actual = merge([], [2, 5, 8, 11, 14])
        XCTAssertEqual(expected, actual)
    }
    
    func testL2Empty() {
        let expected = [1, 3, 5, 7]
        let actual = merge([1, 3, 5, 7], [])
        XCTAssertEqual(expected, actual)
    }

    func testNoOverlap() {
        let expected = [1, 2, 3, 4, 5, 6]
        let actual = merge([1, 2, 3], [4, 5, 6])
        XCTAssertEqual(expected, actual)
    }
}

// Infrastructure
class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
Tests.defaultTestSuite.run()



