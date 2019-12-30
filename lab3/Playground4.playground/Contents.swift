import UIKit
/*:
 # Playground4
 Name: Yunyan Shi
 */

/*:
 **Task 1:**
 Create a class named Rectangle with the following:
 * properties for the length and width (both Float)
 * an init method with two parameters
 * a displayDimensions method that prints the length and width, clearly labeled
 * a calculateArea method with no parameters that calculates and returns the area
 
*/

class Rectangle {
    var length: Float
    var width: Float
    
    init(length: Float, width: Float) {
        self.length = length
        self.width = width
    }
    
    func displayDimensions() {
        print("The length is \(length)\nThe width is \(width)")
    }
    
    func calculateArea() -> Float {
        return length * width
    }
}




/*:
 **Task 2:**
 Create a class named Box that is a subclass of the Rectangle class.  The Box class has the following:
* a property for the height (Float)
* an init method with 3 parameters
* override the displayDimensions method to also print the height, clearly labeled
* override the calculateArea method to calculate and return the surface area of the Box (all 6 sides)
* a calculateVolume method with no parameters that calculates and returns the volume of the Box
*/

class Box: Rectangle {
    var height: Float
    
    init(length:Float, width: Float, height: Float) {
        self.height = height
        super.init(length: length, width: width)
    }
    
    override func displayDimensions() {
        super.displayDimensions()
        print("The height = \(height)")
    }
    
    override func calculateArea() -> Float {
        return (super.calculateArea() + height * width + height * length) * 2
    }
    
    func calculateVolume() -> Float {
        return super.calculateArea() * height
    }
}




//:**Task 3:** Create a Rectangle object and call the displayDimensions and calculateArea methods and print the area.  You must label the area returned by the method.
let rectangle1 = Rectangle(length: 5.5, width: 3)
rectangle1.displayDimensions()
print("The area of this rectangle is \(rectangle1.calculateArea())\n")



//:**Task 4:** Create a Box object and call the displayDimensions, calculateArea and calculateVolume methods. Print the area and volume returned by the methods, clearly labeled

let box1 = Box(length: 10, width: 2.5, height: 3.2)
box1.displayDimensions()
print("The surface area of this box is \(box1.calculateArea())")
print("The volume of this box is \(box1.calculateVolume())")
