import UIKit


// QUESTION 1
//1. Create filter function
// Complexity O(n)

var array1 = [1,3,5,2,0,1,3,7,2,4,4,5,7,9,0]
let filterEven = array1.filter{ element in
//    if element % 2 == 0{
//        return true
//    }
//    else{
//        return false
//    }
       element % 2 == 0
}
print(filterEven)


//QUESTION 2
// 1. Create map function
// Complextiy O(n)
let maparray1 = array1.map{ element in
    return element + 2
}
print(maparray1)

//MARK:- Question 3 Function to accept integer arrray and a target such that sum of element
//inputArr = [1,4,6,7,4] targ = 5
//output = [[0,1],[0,4]]
var inputArray = [1,2,4,5,3,2]
var target = 6
var outputArray: [[Int]] = []

for i in 0..<inputArray.count{
    for j in i+1..<inputArray.count{
        if inputArray[i] + inputArray[j] == target{
            outputArray.append([i,j])
        }
    }
}
print(outputArray)


//MARK:- Question 4 Function which gives count of characters in a string input "NidhiMishra" to ["N" : 1, "i" : 3....]
// Complexity O(n)

var nameString = "nidhimishra"

var dictString: [Character:Int] = [:]
for char in nameString{
//    if dictString.keys.contains(char){
//        let val = dictString[char]!
//        var val2 = val + 1
//        dictString[char] = val2
//    }else{
//        dictString[char] = 1
//    }
    dictString[char] = (dictString[char] ?? 0) + 1
}
print(dictString)

//MARK:- Question 5 Dunction to reverse words in string
// Complexity O(n)

let inputString = "the sky is blue"
var subString = inputString.components(separatedBy: " ")
var reverseStringArray = subString.reversed()
var joinString = reverseStringArray.joined(separator: " ")
print(joinString)

