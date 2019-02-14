/*
 Get Swifty Part 1 (Variables and Constants)
 Homework assignment #1 for the course Get Swifty on https://pirple.thinkfic.com
 Patrick Kalkman
 patrick@simpletechture.nl
*/

import UIKit

let songName : String = "Bohemian Rhapsody"
let albumName : String = "A Night at the Opera"
let artistName : String = "Queen"
let songLengthInMinutes : Float = 5.55
let songLengthInSeconds : Int = 5 * 60 + 55 // Length of the song is 5:55
let songIsWrittenBy : String = "Freddie Mercury"
let songDescription : String = "Bohemian Rhapsody is a six-minute suite, consisting of several sections without a chorus: an intro, a ballad segment, an operatic passage, a hard rock part and a reflective coda. The song is a more accessible take on the 1970s progressive rock genre."
// Use a tuple for storing the 4 band members
let bandMembers : (String, String, String, String) = ("Freddie Mercury", "Brian May", "John Deacon", "Roger Meddows Taylor")
let genres : (String, String, String) = ("Progressive rock‎", "Hard rock", "Progressive pop")
let format : String = "7-inch single"
// Construct the release date by using the DateFormatter
let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"
let releaseDate : Date? = formatter.date(from: "1975/10/31")
let releaseYear : Int = 1975

print("Song: \(songName)")
print("Album: \(albumName)")
print("Artist: \(artistName)")
print("Song length in seconds: \(songLengthInSeconds) s")
print("Song length in minutes: \(songLengthInMinutes) m")
print("Song writer: \(songIsWrittenBy)")
print("Band members: \(bandMembers.0), \(bandMembers.1), \(bandMembers.2), \(bandMembers.3)")
print("Genres: \(genres.0), \(genres.1), \(genres.2)")
print("Song description: \(songDescription)")
// We are allowed to force unwrap because we know that we explictly set the date
print("Song is released on: \(formatter.string(from: releaseDate!))")
print("Song is released in year: \(releaseYear)")



