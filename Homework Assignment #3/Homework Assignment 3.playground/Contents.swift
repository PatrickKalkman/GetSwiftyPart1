/*
   Get Swifty Part 1 (Control Flow)
   Homework assignment #3 for the course Get Swifty - Part 1 on https://pirple.thinkfic.com
   Patrick Kalkman
   patrick@simpletechture.nl

   Details:

   Write a program that prints the numbers from 1 to 100.
   But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz".
   For numbers which are multiples of both three and five print "FizzBuzz".

   Extra Credit:

   Instead of only printing "fizz", "buzz", and "fizzbuzz", add a fourth print statement: "prime". You should print this whenever you encounter a number that is prime (divisible only by itself and one). As you implement this, don't worry about the efficiency of the algorithm you use to check for primes. It's okay for it to be slow.
*/

// Use a for loop using a closed range from 1 to 100
for numberToCheck in 1...100 {

    // check if the number can be divided by 3
    let isFizz : Bool = numberToCheck % 3 == 0
    // check if the number can be divided by 5
    let isBuzz : Bool = numberToCheck % 5 == 0
    // check if both conditions are true
    let isFizzBuzz : Bool = isFizz && isBuzz

    // if both conditions are true print FizzBuzz first, the order of the if matters
    if (isFizzBuzz) {
        print("FizzBuzz")
    } else if (isFizz) {
        print("Fizz")
    } else if (isBuzz) {
        print("Buzz")
    } else {
        print(numberToCheck)
    }

    var isPrime : Bool = true
    
    // Numbers 1 and 2 are handled specially, 1 is no prime and 2 is.
    if (numberToCheck == 1) {
        isPrime = false
    } else if (numberToCheck == 2) {
        isPrime = true
    } else if (numberToCheck > 2) {
        // Check if the numberToCheck is a prime number by dividing it with
        // the primeCheck number. If the remainder is 0, the numberToCheck is no
        // prime and we exit the loop using the break statement
        let upperBound : Int = numberToCheck - 1
        for primeCheck in 2...upperBound {
            if (numberToCheck % primeCheck == 0) {
                isPrime = false
                break
            }
        }
    }

    // If the flag isPrime is true we print that the number is a prime number
    if (isPrime){
        print("\(numberToCheck) = Prime")
    }
}


