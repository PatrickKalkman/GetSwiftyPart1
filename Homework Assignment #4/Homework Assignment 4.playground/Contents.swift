/*
   Get Swifty Part 1 (Functions)
   Homework assignment #4 for the course Get Swifty - Part 1 on https://pirple.thinkfic.com
   Patrick Kalkman
   patrick@simpletechture.nl

Details:

Create a function called "timeAdder" that can add two time values together. For example, it should be able to add 25 hours and 3 days together. 

The function should accept 4 parameters:

value1, label1, value2, label2
- value1 and value2 should accept positive integers  
- label1 and label2 should accept any of the following strings: "seconds", "minutes", "hours", "days", "second", "minute", "hour", "day"

For example your function may be called in any of the following ways:
timeAdder(1,"minute",3,"minutes")
timeAdder(5,"days",25,"hours")
timeAdder(1,"minute",240,"seconds")

Requirements:
1. Your function should include at least one switch
2. Your function must accept any possible combination of inputs 
3. If the inputs are valid, it should return a tuple with 2 variables inside of it: value3, and  label3. For example:
return (5,"minutes"). The exact label you choose to return for label3 ("minutes" for example) is up to you.
4. If the inputs are invalid or impossible, it should return false. Here are examples of impossible and invalid inputs:
timeAdder(5,"hour",5,"minutes") // This is impossible because "hour" is singular and 5 is plural
timeAdder(false,false,5,"minutes") // This is invalid because the first 2 arguments are not the correct types
timeAdder({},"days",5,"minutes") // This is invalid because the first argument is the wrong type

Extra Credit:
Rather than returning an arbitrary label for label3, return the largest label that can be used with an integer value
For example if someone calls:
timeAdder(20,"hours",4,"hours")
You could return: (1,"day") rather than (24,"hours")

But if they called
timeAdder(20,"hours",5,"hours")
You would return (25,"hours") because you could not use "days" with an integer value to represent 25 hours.
*/

// Constants for converting time
let numberOfSecondsPerMinute : UInt = 60
let numberOfSecondsPerHour : UInt = 60 * numberOfSecondsPerMinute
let numberOfSecondsPerDay: UInt = 24 * numberOfSecondsPerHour

// This function validates the given time value and label combination
func isValidTimeValueTimeLabelCombination(_ timeValue: UInt, _ timeLabel: String) -> Bool
{
    // Valid labels are: "seconds", "minutes", "hours", "days", "second", "minute", "hour", "day"
    switch timeLabel {
    case "days", "hours", "seconds", "minutes":
        if (timeValue > 1) {
           return true
        } else {
           print("The time value should be more than 1 when using a plural time labels")
           return false
        }
    case "second", "minute", "hour", "day":
        if (timeValue == 1) {
            return true
        } else {
           print("The time value should be 1 when using a singular time label")
           return false
        }
    default:
        print("The timeLabel: \(timeLabel) is not a valid time label")
        return false
    }    
}

// This function converts the given time value label combination into seconds
func convertToSeconds(_ timeValue: UInt, _ timeLabel: String) -> UInt 
{
    // Valid labels are: "seconds", "minutes", "hours", "days", "second", "minute", "hour", "day"
    switch timeLabel {
    case "seconds", "second":
        return timeValue
    case "minutes", "minute":
        return timeValue * numberOfSecondsPerMinute
    case "hours", "hour":
        return timeValue * numberOfSecondsPerHour
    case "days", "day": 
        return timeValue * numberOfSecondsPerDay
    default:
        // This should never happen as we validate the time value label combination up front
        fatalError("The timeLabel: \(timeLabel) is not a valid time label")
    }
}

// This function generates the biggest time label combination that is possible with whole numbers
func generateLargestTimeValueLabelCombination(_ timeInSeconds: UInt) -> (timeValue: UInt, timeLabel: String)
{
   // First we try to convert the seconds to whole days
   if (timeInSeconds % numberOfSecondsPerDay == 0)
   {
      let days : UInt = UInt(timeInSeconds / numberOfSecondsPerDay)
      if (days > 1) {
         return (timeValue: days, "days")
      }
      return (timeValue: days, "day")
   // otherwise we check if can convert into whole hours
   } else if (timeInSeconds % numberOfSecondsPerHour == 0) {
      let hours : UInt = UInt(timeInSeconds / numberOfSecondsPerHour)
      if (hours > 1) {
         return (timeValue: hours, "hours")
      }
      return (timeValue: hours, "hour")
   // otherwise we try to convert it to whole minutes
   } else if (timeInSeconds % numberOfSecondsPerMinute == 0) {
      let minutes: UInt = UInt(timeInSeconds / numberOfSecondsPerMinute)
      if (minutes > 1) {
         return (timeValue: minutes, "minutes")
      }
      return (timeValue: minutes, "minute")
   } else {
   // If all fails we return the time value in seconds
    if (timeInSeconds > 1) {
        return (timeValue: timeInSeconds, "seconds")
    } else {
        return (timeValue: timeInSeconds, "second")
    }
   }
}

// This function adds two time values with a different time label and returns the total in the largest possible time label that
// can be expressed in whole numbers.
func timeAdder(_ firstTimeValue: UInt, _ firstTimeLabel: String, _ secondTimeValue: UInt, _ secondTimeLabel: String) -> (timeValue: UInt, timeLabel: String)
{
    // Check if the given time value and labels are valid
    if (isValidTimeValueTimeLabelCombination(firstTimeValue, firstTimeLabel) && 
         isValidTimeValueTimeLabelCombination(secondTimeValue, secondTimeLabel)) {

        // Convert both time values to seconds
        let firstTimeValueInSeconds = convertToSeconds(firstTimeValue, firstTimeLabel)
        let secondTimeValueInSeconds = convertToSeconds(secondTimeValue, secondTimeLabel)

        // Calculcate the total time in seconds
        let totalTimeInSeconds = firstTimeValueInSeconds + secondTimeValueInSeconds;

        // Try to express the total time in the largest whole number time label combination
        return generateLargestTimeValueLabelCombination(totalTimeInSeconds)
    }

    // Instead of false as stated in the requirements we return an invalid tuple otherwise we would have to use Any as a return type
    // and it should be cast to a tuple to perform validation which is considered not a good practice.
    return (0, "invalid")
}

// Test the requirements

// Valid time additions
print("timeAdder(60 * 24, \"minutes\",  60 * 24 * 60, \"seconds\") should return (2, \"days\") is",
        timeAdder(60 * 24, "minutes",  60 * 24 * 60, "seconds") == (2, "days"))
print("timeAdder(1, \"minute\", 3, \"minutes\") should return (4, \"minutes\") is",
        timeAdder(1,"minute",3,"minutes") == (4, "minutes"))
print("timeAdder(5, \"days\", 25, \"hours\")) should return (145, \"hours\") is",
        timeAdder(5, "days", 25, "hours") == (145, "hours"))
print("timeAdder(1, \"minute\", 240, \"seconds\") should return (5, \"minutes\") is",
        timeAdder(1, "minute", 240, "seconds") == (5, "minutes"))
print("timeAdder(20, \"hours\", 4, \"hours\") == (1, \"day\") is",
        timeAdder(20, "hours", 4, "hours") == (1, "day"))

// Invalid time additions
print("timeAdder(5, \"hour\", 5, \"minutes\") == (0, \"invalid\") is",
      timeAdder(5, "hour", 5, "minutes") == (0, "invalid"))
print("timeAdder(5, \"invalidlabel\", 5, \"minutes\") == (0, \"invalid\") is",
      timeAdder(5, "invalidlabel", 5, "minutes") == (0, "invalid"))
// timeAdder(false,false,5,"minutes") handled by the compiler as the input types are specified as UInt and String
// timeAdder({},"days",5,"minutes") handled by the compiler as the input types are specified as UInt and String

