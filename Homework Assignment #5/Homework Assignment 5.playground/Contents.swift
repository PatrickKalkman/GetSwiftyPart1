/*
   Get Swifty Part 1 (Classes, Structs, and Enums)
   Homework assignment #5 for the course Get Swifty - Part 1 on https://pirple.thinkfic.com
   Patrick Kalkman
   patrick@simpletechture.nl

Details:

 Create a class called "Vehicle" and add methods that allow you to set the "Make", "Model", "Year,", and "Weight".
 The class should also contain a "NeedsMaintenance" boolean that defaults to False, and and "TripsSinceMaintenance" Integer that defaults to 0.
 Next create a subclass that inherits the properties of Vehicle class. Call this new subclass "Cars".
 
 The Cars class should contain a method called "Drive" that sets the state of a boolean isDriving to True.  It should have another method called "Stop" that sets the value of isDriving to false.
 Switching isDriving from true to false should increment the "TripsSinceMaintenance" counter. And when TripsSinceMaintenance exceeds 100, then the NeedsMaintenance boolean should be set to true.
 Add a "Repair" method to either class that resets the TripsSinceMaintenance to zero, and NeedsMaintenance to false.
 
 Create 3 different cars, using your Cars class, and drive them all a different number of times. Then print out their values for Make, Model, Year, Weight, NeedsMaintenance, and TripsSinceMaintenance
 
 Extra Credit:
 
 Create a Planes class that is also a subclass of Vehicle. Add methods to the Planes class for Flying and Landing (similar to Driving and Stopping), but different in one respect: Once the NeedsMaintenance boolean gets set to true, any attempt at flight should be rejected (return false), and an error message should be printed saying that the plane can't fly until it's repaired.
*/
import UIKit

// Super class vehicle
class Vehicle
{
    var make : String
    var model : String
    var year : Int
    var weight: Int
    
    var needsMaintenance: Bool = false
    
    // Use an observable property to set if the vehicle needs maintenance
    var tripsSinceMaintenance: Int = 0 {
        didSet {
            if (tripsSinceMaintenance > 100) {
                needsMaintenance = true
            }
        }
    }
    
    init(make: String, model: String, year: Int, weight: Int) {
        self.make = make
        self.model = model
        self.year = year
        self.weight = weight
    }
    
    // Repair resets the number of trips since maintenance
    func Repair() {
        tripsSinceMaintenance = 0
        needsMaintenance = false
    }
    
    // Print all the fields of the Vehicle class
    func PrintInformation() {
        print("Make: \(make), Model: \(model), Year: \(year), Weight: \(weight), NeedsMaintenance: \(needsMaintenance), TripsSinceMaintenance: \(tripsSinceMaintenance)")
    }
}

// class cars is a sub class of vehicle
class Cars : Vehicle
{
    var isDriving: Bool = false {
        didSet {
            if (oldValue == true && isDriving == false) {
                tripsSinceMaintenance += 1
            }
        }
    }
    
    func Drive() {
        isDriving = true
    }
    
    func Stop() {
        isDriving = false
    }
    

}

// class planes is a sub class of vehicle
class Planes : Vehicle {
    
    var isFlying: Bool = false {
        didSet {
            if (oldValue == true && isFlying == false) {
                tripsSinceMaintenance += 1
            }
        }
    }
    
    // A plane cannot fly if it needs maintenance
    func Fly() {
        if (!needsMaintenance) {
            isFlying = true
        } else {
            print("The plane cannot fly as it needs maintenance")
        }
    }
    
    func Land() {
        isFlying = false
    }
}

let ferrari : Cars = Cars(make: "Ferrari", model: "288 GTO", year: 1984, weight: 1160)
let mercedes : Cars = Cars(make: "Mercedes-Benz", model: "280 SL Pagoda", year: 1963, weight: 1300)
let fiat : Cars = Cars(make: "Fiat", model: "500", year: 1957, weight: 499)

// Drive the ferrari more than 100 times and check to see if it needs maintenance
for _ in (1...110) {
    ferrari.Drive()
    ferrari.Stop()
}
ferrari.PrintInformation()

// Drive the mercedes less thab 100 times and check to see if it needs maintenance
for _ in (1...60) {
    mercedes.Drive()
    mercedes.Stop()
}
mercedes.PrintInformation()

// Drive the fiat more than 100 times and check to see if it needs maintenance
for _ in (1...101) {
    fiat.Drive()
    fiat.Stop()
}
fiat.PrintInformation()

let cessna : Planes = Planes(make: "Cessna", model: "Skyhawk", year: 1956, weight: 760)
// Fly the cessna more than 100 times and check to see if it needs maintenance and cannot fly anymore
for _ in (1...102) {
    cessna.Fly()
    cessna.Land()
}
cessna.PrintInformation()
