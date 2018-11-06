/*
 Two Eggs Problem:
 A building has 100 floors. One of the floors is the highest floor an egg can be dropped from without breaking.
 
 If an egg is dropped from above that floor, it will break. If it is dropped from that floor or below, it will be completely undamaged and you can drop the egg again.
 
 Given two eggs, find the highest floor an egg can be dropped from without breaking, with as few drops as possible.
 */
import Darwin

var numOfEggs:Int = 2
var numOfFloors: [Int] = Array(1...100)
var floorBreaksEgg: Int = Int(arc4random_uniform(UInt32(numOfFloors.count)))

func bruteForce(_ numOfEggs: inout Int, _ numOfFloors: [Int], _ targetFloor: Int) -> Int {
    var i:Int = 0
    repeat {
        if (targetFloor != numOfFloors[i]) {
            i+=1
        } else {
            numOfEggs-=1
            print("Iteration runs \(i) times")
            print("Number of eggs left: \(numOfEggs)")
            return numOfFloors[i]
        }
    } while(i < numOfFloors.count)
    return -1
}

func binarySearch(_ numOfEggs: inout Int, _ numOfFloors: [Int], _ targetFloor: Int) -> Int {
    var floorIndex  = -1
    var ceilingIndex = numOfFloors.count
    var i = 0
    while floorIndex + 1 < ceilingIndex {
        let range = ceilingIndex - floorIndex
        let guessIndex = floorIndex + range / 2
        let guessValue = numOfFloors[guessIndex]
        if (guessValue == targetFloor) {
            print("Iteration runs \(i) times")
            return guessValue
        } else if (guessValue > targetFloor) {
            ceilingIndex = guessIndex
        } else {
            floorIndex = guessIndex
        }
        i+=1
    }
    return -1
}

print("highest floor to drop without breaking the egg is \(bruteForce(&numOfEggs, numOfFloors, floorBreaksEgg))")
print("highest floor to drop without breaking the egg is \(binarySearch(&numOfEggs, numOfFloors, floorBreaksEgg))")
