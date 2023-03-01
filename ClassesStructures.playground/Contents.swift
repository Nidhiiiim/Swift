import UIKit

var greeting = "Hello, playground"

/*
 QUESTION 1
 "Print Hello world 5 times. create an array having values from 100 to 1.
 Create an double array and add 1.5 to each element.
 Create an array and remove duplicates from the array.
 
 QUESTION 2
 Create a dictionary [“TEN”: [1 to 10], “Twenty”: [11 to 20]] and change all values for key “TEN” to 10 to 1 Print Hello world 5 times.print index 1 to 10
 
 QUESTION 3
 Create an String array and add “OMG” to each element
 
 QUESTION 4
 Create a dictionary [“TEN”: [1 to 10], “Twenty”: [11 to 20]] and change all values for key “TEN” to 10 to 1
 
 QUESTION 5
 Create a array and count each unique elements in the array
 
 QUESTION 6
 Create an array [1,2,3,4,5,1,2,3,4,5] return array of 2 numbers whose sum is 4
 [[1,3], [2,2], [3,1]]"

 QUESTION 7
 "Create a class vehicles with stored values
 1. Number of tires (optional)
 2. occupancy (number of seats)
 3. Vehicle type (optional)
 4. weight of vehicle
 5. Price

 QUESTION 8
 Create 3 inits that accepts
 accepts all
 one with 1, 4, 3 & 5 with default 2 as 4 & default 1, 3 as nil
 two with 2, 3, 4 & 5 with default 1 as 4 & default 1, 3 as nil

 QUESTION 9
 Create functions
 1. getMileage -> (weight * (occupancy  * 100) )/ 100 * 1.5
 2. getVehicleType
 3. changeWeightOfVehicle
 4. isLuxuryVehicle (if price > $60,000)

 Create a deep copy convinence init"

 QUESTION 10
 "create a stored property in class as ""age"".
  create a getter and setter
  modify setter to set max value of 10 irespective of what we set it to.

 QUESTION 11
  create a new stored property ""Area"" inside a class square which on get givers the area of square"


 Vehicle: level 1; Cars: level 2, Bus: level 2, Truck: level 2; TataNexon: level 3, Mercedes: level 3, Ashok Leyland: level 3

 */

// MARK:- QUESTION 1
/*Print Hello world 5 times. create an array having values from 100 to 1. Create an double array and add 1.5 to each element. Create an array and remove duplicates from the array. */

func printNTimes(value:Int){
    for _ in 1...value {
        print("Hello World")
    }
}
printNTimes(value: 5)
var arrTp = [Int](1...100)
arrTp = arrTp.reversed()
print(arrTp)
var arrDouble: [Double] = [1.0,2.5,5.7,4.6,1.0,2.5]
var arrAdded = arrDouble.map{ element in
    return element + 1.5
}
print(arrAdded)
var arrUnique = Array(Set(arrDouble))
print(arrUnique)

// MARK:- QUESTION 2
/* Create a dictionary [“TEN”: [1 to 10], “Twenty”: [11 to 20]] and change all values for key “TEN” to 10 to 1 Print Hello world 5 times.print index 1 to 10 */

var dictPractice: [String:[Int]] = [:]

func addItems(str:String, arr:[Int]){
    dictPractice[str] = arr
    print(dictPractice)
}

addItems(str: "TEN",arr: [1,2,3,4,5,6,7,8,9,10])
addItems(str: "TWENTY",arr: [11,12,13,14,15,16,17,18,19,20])


/*
 QUESTION 7
 "Create a class vehicles with stored values
 1. Number of tires (optional)
 2. occupancy (number of seats)
 3. Vehicle type (optional)
 4. weight of vehicle
 5. Price
 */

/*
 QUESTION 9
 Create functions
 1. getMileage -> (weight * (occupancy  * 100) )/ 100 * 1.5
 2. getVehicleType
 3. changeWeightOfVehicle
 4. isLuxuryVehicle (if price > $60,000)
 */

class vehicles{
    var tires: Int?
    var occupancy: Int
    var vType: String?
    var vWeight: Int
    var vPrice: Int
    
    init(tires:Int?, occupancy:Int, vType:String?, vWeight:Int, vPrice:Int) {
        self.tires = tires
        self.occupancy = occupancy
        self.vPrice = vPrice
        self.vType = vType
        self.vWeight = vWeight
    }
    init(vWeight:Int, vPrice:Int){
        self.tires = nil
        self.occupancy = 4
        self.vWeight = vWeight
        self.vType = nil
        self.vPrice = vPrice
    }
    
    func getMileage() -> Double{
        return ((Double(vWeight)*(Double(occupancy) * 100)/100)*1.5)
    }
    
    func getVehicleType() -> String?{
        return vType
    }
    
    func isLuxuryVehicle() -> Bool{
        if vPrice > 60000{
            return true
        }
        else{
            return false
        }
    }
}

/*
 QUESTION 11
Create a new stored property ""Area"" inside a class square which on get givers the area of square"
 */
class Square{
    var side: Double = 0.0
    var area: Double {
        get{
            return side * side
        }
        set(newArea){
            self.side = sqrt(newArea)
            
        }
    }
    init(side:Double){
        self.side = side
    }
}

let x = Square(side: 5.0)
print(x.area)
x.area = 36
print(x.side)

/*
 Vehicle: level 1; Cars: level 2, Bus: level 2, Truck: level 2; TataNexon: level 3, Mercedes: level 3, Ashok Leyland: level 3
 
 Insted doing vehicle and 2 subclasses of car and electric car.
 */

// Grandparent class
class Vehicle {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func drive() {
        print("Vehicle is Driving...")
    }
}

// Parent class
class Car: Vehicle {
    var model: String
    
    init(brand: String, model: String) {
        self.model = model
        super.init(brand: brand)
    }
    
    func startEngine() {
        print(" Car is Starting engine...")
    }
    
    func batteryLife(){
        print("Car has Good Battery Life")
    }
}

// Child class
class ElectricCar: Car {
    var batteryCapacity: Double
    
    init(brand: String, model: String, batteryCapacity: Double) {
        self.batteryCapacity = batteryCapacity
        super.init(brand: brand, model: model)
    }
    
    func recharge() {
        print("Electric Car is Recharging...")
    }
    
    override func batteryLife() {
        print("Electric Car has best battery life")
    }
}

// Creating an instance of the child class
let myElectricCar = ElectricCar(brand: "Tesla", model: "Model S", batteryCapacity: 100.0)
print(myElectricCar.brand)
print(myElectricCar.model)
print(myElectricCar.batteryCapacity)
myElectricCar.startEngine()
myElectricCar.drive()
myElectricCar.recharge()
myElectricCar.batteryLife()

let celerio = Car(brand: "Suzuki", model: "Vxi")
celerio.batteryLife()
celerio.startEngine()
celerio.drive()






