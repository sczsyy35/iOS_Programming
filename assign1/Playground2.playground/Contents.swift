import UIKit
/*:
 # Playground2
 Name: Yunyan Shi
 */

//: **Task A:** Create an array of the top 20 programming languages listed on the August 2019 Tiobe Index. Use a loop to print the position and language for the top 20 languages. Be sure to comment your code. https://www.tiobe.com/tiobe-index/
let programmingLanguages = ["Java", "C", "Python", "C++", "C#", "Visual Basic.NET", "JavaScrip", "PHP", "Objective-C", "SQL", "Ruby", "MATLAB", "Groovy", "Delphi/Object Pascal", "Assembly language", "Visual Basic", "Go", "Swift", "Perl", "R"]
print("Top 20 Programming Languages Tiobe Index August 2019")
for index in 0...programmingLanguages.count - 1 {
    print("\(index + 1). \(programmingLanguages[index])")
}

//: **Task B:** Create an array of the Stack Overflow top 15 technologies (keys) and another array of the corresponding percentages (values).  Use the two arrays to create a dictionary. Sort the dictionary in descending order by value and use a loop to print each technology and its percentage. https://insights.stackoverflow.com/survey/2019#technology http://studyswift.blogspot.com/2017/05/how-to-sort-array-and-dictionary.html
print("\nStack Overflow Most Popular Technologies 2019")
let technologies = ["JavaScript", "HTML/CSS", "SQL", "Python", "Java", "Bash/Shell/PowerShell", "C#", "PHP", "C++", "TypeScript", "C", "Ruby", "Go", "Assembly", "Swift"]
let percentages = [67.8, 63.5, 54.4, 41.7, 41.1, 36.6, 31.0, 26.4, 23.5, 21.2, 20.6, 8.4, 8.2, 6.7, 6.6]
let dictionary = Dictionary(uniqueKeysWithValues: zip(technologies,percentages))
let dictValDec = dictionary.sorted(by: { $0.value > $1.value })
for item in dictValDec {
    print("\(item.key): \(item.value)%")
}



