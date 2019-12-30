/*:
 # Playground1
 Name: Yunyan Shi
 */

//: **Task 1:** Use a loop to print all numbers divisible by 13 in the range 1-100.

for index in 1...100 {
    if index % 13 == 0 {
        print(index)
    }
}

/*:
 **Task 2:** Create a variable named grade and assign a value to it in the range 0-100. Use the grade variable as an argument to the switch statement.  Then create a switch statement to determine and print the grade based on the following ranges:
* 93-100 A
* 90-92 A-
* 87-89 B+
* 83-86 B
* 80-82 B-
* 77-79 C+
* 70-76 C
* 67-69 D+
* 63-66 D
* 60-62 D-
* 0-59 F
*/

var grade = 67
switch grade {
case 93...100:
    print("A")
case 90...92:
    print("A-")
case 87...89:
    print("B+")
case 83...86:
    print("B")
case 80...82:
    print("B-")
case 77...79:
    print("C+")
case 70...76:
    print("C")
case 67...69:
    print("D+")
case 63...66:
    print("D")
case 60...62:
    print("D-")
case 0...59:
    print("F")
default:
    print("Wrong grade entered")
}

//: **Task 3:** Create an array of 5 animal names named animalArray. Create an array index that is an Optional. Initialize the array index. Write an if/else statement to print the array item if it is not nil, otherwise print a message that the index does not contain a value. Use the code on page 48 as an example.

let animalArray = ["Pino", "Miumiu", "Daisy", "Chewie", "Lola"]
var index: Int!
index = 3
if index != nil {
    print(animalArray[index])
} else {
    print("Index does not contain a value.")
}


/*:
**Task 4:** Read the following tutorial and create the code in Figure 2-23:
https://www.appcoda.com/learnswift/playgrounds.html
Modify emojiDict to add two additional emojis with descriptions to the dictionary. To add an emoji character press control+command+space, or Edit -> Emoji & Symbols. Modify the wordToLookup variable by assigning one of the emojis that you added to the dictionary. If you want more information about dictionaries you can look ahead to chapter 13.
 */
import UIKit
var emojiDict: [String: String] = ["👻": "Gost", "💩": "Poop", "😤": "Angry", "😱": "Scream", "👾": "Alien Monster", "❤️": "heart", "🎃": "Pumpkin"]

var wordToLookup = "❤️"
var meaning = emojiDict[wordToLookup]

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
containerView.backgroundColor = UIColor.orange

let emojiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLabel)

let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = meaning
meaningLabel.font = UIFont.systemFont(ofSize:30.0)
meaningLabel.textColor = UIColor.white

containerView.addSubview(meaningLabel)




//: **Task 5:** Be sure to comment your code.




