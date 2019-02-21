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

func isValidTimeValueTimeLabelCombination(_ timeValue: UInt, _ timeLabel: String) -> Bool
{
    // Valid labels are: "seconds", "minutes", "hours", "days", "second", "minute", "hour", "day"
    switch timeLabel {
    case "days", "hours", "seconds", "minutes":
        if (timeValue > 1) {
           return true
        } else {
           print("The time value should be more than 1 when using plural time labels")           
           return false
        }
    case "second", "minute", "hour", "day":
        if (timeValue == 1) {
            return true
        } else {
           print("The time value should be 1 when using singular time labels")
           return false
        }
    default:
        print("The timeLabel: \(timeLabel) is not a valid time label")
        return false
    }    
}

func convertToSeconds(_ timeValue: UInt, _ timeLabel: String) -> UInt 
{
    // Valid labels are: "seconds", "minutes", "hours", "days", "second", "minute", "hour", "day"
    switch timeLabel {
    case "seconds", "second":
        return timeValue
    case "minutes", "minute":
        return timeValue * 60
    case "hours", "hour":
        return timeValue * 60 * 60
    case "days", "day": 
        return timeValue * 60 * 60 * 24
    default:
        // This should never happen as we validate the time value label combination up front
        fatalError("The timeLabel: \(timeLabel) is not a valid time label")
    }
}

func generateLargestTimeValueLabelCombination(_ timeInSeconds: UInt) -> (timeValue: UInt, timeLabel: String)
{
   // First we try to convert to days
   if (timeInSeconds % (60 * 60 * 24) == 0)
   {
      let days : UInt = UInt(timeInSeconds / (60 * 60 * 24))
      if (days > 1) {
         return (timeValue: days, "days")
      }
      return (timeValue: days, "day")
   } else if (timeInSeconds % (60 * 60) == 0) {
      let hours : UInt = UInt(timeInSeconds / (60 * 60))
      if (hours > 1) {
         return (timeValue: hours, "hours")
      }
      return (timeValue: hours, "hour")
   } else if (timeInSeconds % 60 == 0) {
      let minutes: UInt = UInt(timeInSeconds / 60)
      if (minutes > 1) {
         return (timeValue: minutes, "minutes")
      }
      return (timeValue: minutes, "minute")
   } else {
      return (timeValue: timeInSeconds, "seconds")
   }
}

func timeAdder(_ firstTimeValue: UInt, _ firstTimeLabel: String, _ secondTimeValue: UInt, _ secondTimeLabel: String) -> Any  
{
    if (isValidTimeValueTimeLabelCombination(firstTimeValue, firstTimeLabel) && 
        isValidTimeValueTimeLabelCombination(secondTimeValue, secondTimeLabel)) {

        let firstTimeValueInSeconds = convertToSeconds(firstTimeValue, firstTimeLabel)
        let secondTimeValueInSeconds = convertToSeconds(secondTimeValue, secondTimeLabel)

        let totalTimeInSeconds = firstTimeValueInSeconds + secondTimeValueInSeconds;

        return generateLargestTimeValueLabelCombination(totalTimeInSeconds)
    }

    return false
}

print(timeAdder(60 * 24, "minutes",  60 * 24 * 60, "seconds"))
print(timeAdder(1,"minute",3,"minutes"))
print(timeAdder(5,"days",25,"hours"))
print(timeAdder(1,"minute",240,"seconds"))
print(timeAdder(20,"hours",4,"hours"))

