//  Name: Yunyan Shi
//  Lab 13
//
//  MyDrawView.swift
//  MyDrawKit
//
//  Created by Yunyan Shi on 11/15/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class MyDrawView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.white
    @IBInspectable var endColor: UIColor = UIColor.red
    @IBInspectable var endRadius: CGFloat = 100

    
    override func draw(_ rect: CGRect) {
        /// Drawing a line
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 30, y: 30))
        context?.addLine(to: CGPoint(x: 300, y: 400))
        context?.strokePath()
        */
        
        
        
        /// Drawing Paths
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x:100, y: 100))
        context?.addLine(to: CGPoint(x: 150, y: 150))
        context?.addLine(to: CGPoint(x: 100, y: 200))
        context?.addLine(to: CGPoint(x: 50, y: 150))
        context?.addLine(to: CGPoint(x: 100, y: 100))
        context?.strokePath()
        */
        
        
        
        /// Drawing a Rectangle
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: 90,y: 100,width: 200,height: 80)
        context?.addRect(rectangle)
        context?.strokePath()
        */
        
        
        
        /// Drawing an Ellipse
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: 85,y: 100,width: 200,height: 80)
        context?.addEllipse(in: rectangle)
        context?.strokePath()
        */
        
        
        
        /// Drawing a Circle
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: 85,y: 100,width: 200,height: 200)
        context?.addEllipse(in: rectangle)
        context?.strokePath()
        */
        
        
        
        /// Filling a Path with a Color
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 100, y: 100))
        context?.addLine(to: CGPoint(x: 150, y: 150))
        context?.addLine(to: CGPoint(x: 100, y: 200))
        context?.addLine(to: CGPoint(x: 50, y: 150))
        context?.addLine(to: CGPoint(x: 100, y: 100))
        context?.setFillColor(UIColor.red.cgColor)
        context?.fillPath()
        */
        
        
        /// Filling a Rectangle with a Color
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: 85,y: 100,width: 200,height: 80)
        context?.addRect(rectangle)
        context?.strokePath()
        context?.setFillColor(UIColor.red.cgColor)
        context?.fill(rectangle)
        */
        
        
        
        /// Drawing an Arc
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 100, y: 100))
        context?.addArc(tangent1End: CGPoint(x: 100, y: 200), tangent2End: CGPoint(x: 300, y: 200), radius: 100)
        context?.strokePath()
        */
        
        
        
        /// Drawing a Cubic Bézier Curve
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 30, y: 30))
        context?.addCurve(to: CGPoint(x: 20, y: 50), control1: CGPoint(x: 300, y: 250), control2: CGPoint(x: 300, y: 70))
        context?.strokePath()
         */
        
        
        
        /// Drawing a Quadratic Bézier Curve
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: 10, y: 200))
        context?.addQuadCurve(to: CGPoint(x: 300, y: 200), control: CGPoint(x: 150, y: 10))
        context?.strokePath()
        */
        
        
        
        /// Drawing Dashed Lines
        /**
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(20.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let dashArray:[CGFloat] = [2,6,4,2]
        context?.setLineDash(phase: 3, lengths: dashArray)
        context?.move(to: CGPoint(x: 10, y: 200))
        context?.addQuadCurve(to: CGPoint(x: 300, y: 200), control: CGPoint(x: 150, y: 10))
        context?.strokePath()
        */
        
        
        /// Drawing Shadows
        /**
        let context = UIGraphicsGetCurrentContext()
        let myShadowOffset = CGSize (width: -10, height: 15)
        context?.saveGState()
        context?.setShadow(offset: myShadowOffset, blur: 5)
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: 60,y: 170,width: 200,height: 80)
        context?.addEllipse(in: rectangle)
        context?.strokePath()
        context?.restoreGState()
        */
        
        
        
        /// Drawing a Linear Gradient Using Four Colors
        /**
        let context = UIGraphicsGetCurrentContext()
        let locations: [CGFloat] = [0.0, 0.25, 0.5, 0.75 ]
        let colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor,UIColor.yellow.cgColor]
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorspace,colors: colors as CFArray, locations: locations)
        var startPoint = CGPoint()
        var endPoint = CGPoint()
        startPoint.x = 0.0
        startPoint.y = 0.0
        endPoint.x = 600
        endPoint.y = 600
        if let gradient = gradient {
            context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)
        }
        */
        
        
        
        /// Drawing a Radial Gradient
        /**
        let context = UIGraphicsGetCurrentContext()
        let locations: [CGFloat] = [0.0, 0.5, 1.0]
        let colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.cyan.cgColor]
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorspace, colors: colors as CFArray, locations: locations)
        var startPoint = CGPoint()
        var endPoint = CGPoint()
        startPoint.x = 100
        startPoint.y = 100
        endPoint.x = 200
        endPoint.y = 200
        let startRadius: CGFloat = 10
        let endRadius: CGFloat = 75
        if let gradient = gradient {
            context?.drawRadialGradient(gradient, startCenter: startPoint, startRadius: startRadius, endCenter: endPoint, endRadius: endRadius, options: [])
        }
        */
        
        
        
        /// Drawing a Shiny Blue Sphere
        /**
        let context = UIGraphicsGetCurrentContext()
        let locations: [CGFloat] = [0.0, 1.0]
        let colors = [UIColor.white.cgColor,
                      UIColor.blue.cgColor]
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorspace, colors: colors as CFArray, locations: locations)
        var startPoint = CGPoint()
        var endPoint = CGPoint()
        startPoint.x = 180
        startPoint.y = 180
        endPoint.x = 200
        endPoint.y = 200
        let startRadius: CGFloat = 0
        let endRadius: CGFloat = 75
        if let gradient = gradient {
            context?.drawRadialGradient (gradient, startCenter: startPoint, startRadius: startRadius, endCenter: endPoint, endRadius: endRadius, options: .drawsBeforeStartLocation)
        }
        */
        
        
        
        /// Drawing an Image Filterd by the Core Image Framework
        if let myimage = UIImage(named: "cat.png"),
            let sepiaFilter = CIFilter(name: "CISepiaTone") {
                let cimage = CIImage(image: myimage)
                sepiaFilter.setDefaults()
                sepiaFilter.setValue(cimage, forKey: "inputImage")
                sepiaFilter.setValue(NSNumber(value: 0.8 as Float), forKey: "inputIntensity")
                let image = sepiaFilter.outputImage
                let context = CIContext(options: nil)
                let cgImage = context.createCGImage(image!, from: image!.extent)
                let resultImage = UIImage(cgImage: cgImage!)
                let imageRect = UIScreen.main.bounds
                resultImage.draw(in: imageRect)
        }
    }
}
