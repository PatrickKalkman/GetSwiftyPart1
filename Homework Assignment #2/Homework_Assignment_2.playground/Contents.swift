/*
 Get Swifty Part 1 (Collections)
 Homework assignment #2 for the course Get Swifty - Part 1 on https://pirple.thinkfic.com
 Patrick Kalkman
 patrick@simpletechture.nl
*/

/* 

Q1: What are the differences between a tuple and an array? 
 
A tuple is a fixed group of values represented as a single value. The number and type of values that a tuple holds are defined up-front. An array is a dynamic list of values which can grow and shrink during run-time. The type of values an array can hold is defined up-front.   

Q2: What are typical use cases for a tuple and for an array?

Tuple use-cases:
1. You want to store the first and last name of an employee. A tuple can be used to have a separate field for first name and a separate field for the last name. 
2. You can use a tuple in case you want to return multiple values from a function. 
3. You can use tuples to define an error code (number) and its description

Array use-case:
1. Store a list of employees using the employee name tuple. New employees can be added to the list.

Q3: What are ranges? And why would you use one instead of an array or tuple? 

A range is a set of predefined values, in which you specify the start and end of the interval of values. A closed range includes both the beginning and the end. A half-open range means that the end is not part of the range. I will use a range if I want to iterate over a set of values using a for-loop. 
*/

// ---- Use case tuple T1: 
// A single employee constructed using a Tuple with a first and last name
var employeePatrick : (firstName: String, lastName: String) = ("Patrick", "Kalkman")
// Another single employee constructed using a Tuple with a first and last name
var employeeJessica: (firstName: String, lastName: String) = ("Jessica", "Pjotr")

// Print complete tuple
print(employeePatrick)
// Print firstName field of tuple using field name
print(employeePatrick.firstName)
// Print firstName field of tuple using field index
print(employeePatrick.0)

// ---- Use case tuple T2: 
func searchEmployee(lastName: String) -> (firstName: String, lastName: String) {
    // No real search implementation, just return a value to demonstrate tuple usage
    return employeePatrick;
}
// Call function and print result
print(searchEmployee(lastName: "Kalkman"))

// --- Use case tuple T3:
var httpStatusOk: (code: Int, description: String) = (200, "OK")
var httpStatusBadRequest: (code: Int, description: String) = (400, "Bad Request")
var httpStatusInternalServerError: (code: Int, description: String) = (500, "Internal Server Error")

// --- Use case array A1:
// An array of employees constructed using the employee name tuples
var employees : [(firstName: String, lastName: String)] = [employeePatrick, employeeJessica]
// Dynamically add a new employee name to the array
employees.append(("Frits", "Dregen"))
// Print the first name of the first employee in the array.
print(employees[0].lastName)

// --- Use case range R1:
// Iterate over 20 values using a closed range
for index in 1...20 {
    print(index)
}
// Iterate over 19 values using a half open range
for index in 1..<20 {
    print(index)
}
