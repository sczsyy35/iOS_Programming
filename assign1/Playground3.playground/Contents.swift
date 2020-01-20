import UIKit
/*:
 # Playground3
 Name: Yunyan Shi
 */


/*:
**Task A:** Create an Employee class with
* properties first name, last name, yearly salary, and position
* an init method with 4 parameters.
* a displayEmployee method that prints the Employee’s full name (last name, first name) their position and yearly salary (formatted as currency)
 */
class Employee {
    var firstName: String
    var lastName: String
    var position: String
    var yearlySalary: Float
    
    init(firstName: String, lastName: String, position: String, yearlySalary: Float) {
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
        self.yearlySalary = yearlySalary
    }
    
    func displayEmployee() {
        print("\(self.lastName), \(self.firstName)    \(self.position)    $\(String(format: "%.2f", self.yearlySalary))")
    }
}



//: **Task B:** Create 15 Employee objects using this data and place each Employee object in an array of Employees

let employeeArray = [
    Employee(firstName: "Pamela", lastName: "Beesly", position: "Receptionist", yearlySalary: 42000),
    Employee(firstName: "Andy", lastName: "Bernard", position: "Sales Director", yearlySalary: 7390),
    Employee(firstName: "Creed", lastName: "Bratton", position: "Quality Assurance", yearlySalary: 62500),
    Employee(firstName: "Jim", lastName: "Halpert", position: "Assistant Regional Manager", yearlySalary: 84000),
    Employee(firstName: "Ryan", lastName: "Howard", position: "Vice President, North East", yearlySalary:  96000),
    Employee(firstName: "Stanley", lastName: "Hudson", position: "Sales Representative", yearlySalary: 68000),
    Employee(firstName: "Kelly", lastName: "Kapoor", position: "Customer Service Rep.", yearlySalary: 65000),
    Employee(firstName: "Phyllis", lastName: "Lapin", position: "Sales Representative", yearlySalary: 62000),
    Employee(firstName: "Kevin", lastName: "Malone", position: "Accountant", yearlySalary: 58500),
    Employee(firstName: "Angela", lastName: "Martin", position: "Senior Accountant", yearlySalary: 6300),
    Employee(firstName: "Oscar", lastName: "Martinez", position: "Accountant", yearlySalary: 61000),
    Employee(firstName: "Meredith", lastName: "Palmer", position: "Supplier Relations", yearlySalary: 46000),
    Employee(firstName: "Dwight", lastName: "Schrute", position: "Assistant Regional Manager", yearlySalary: 84000),
    Employee(firstName: "Michael", lastName: "Scott", position: "Regional Manager", yearlySalary: 91000),
    Employee(firstName: "Toby", lastName: "Flenderson", position:"Human Resources Manager", yearlySalary:69000)
]



//: **Task C:** Use a loop to print the complete data for each Employee in the array by calling the displayEmployee method.  For example: Scott, Michael   Regional Manager  $91000.00

for index in 0...employeeArray.count - 1 {
    employeeArray[index].displayEmployee()
}








