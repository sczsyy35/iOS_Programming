//  Name: Yunyan Shi
//  Lab 16
//
//  ViewController.swift
//  Chapter72
//
//  Created by Yunyan Shi on 12/8/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit
import MobileCoreServices


class ViewController: UIViewController, UIDropInteractionDelegate, UIDragInteractionDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var sepiaButton: UIButton!
    
    var sepiaFilter = true
    
    @IBAction func switchFilter(_ sender: Any) {
        sepiaFilter = sepiaFilter ? false : true
        sepiaButton.setTitle(sepiaFilter ? "Sepia On" : "Sepia Off", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        sepiaButton.isSpringLoaded = true
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        imageView.isUserInteractionEnabled = true
        imageView.addInteraction(UIDropInteraction(delegate: self))
        imageView.addInteraction(UIDragInteraction(delegate: self))
        textView.addInteraction(UIDragInteraction(delegate: self))
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.hasItemsConforming(toTypeIdentifiers: [kUTTypeImage as String, kUTTypeUTF8PlainText as String]) && session.items.count == 1
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate
        session: UIDropSession) -> UIDropProposal {
        let location = session.location(in: self.view)
        let dropOperation: UIDropOperation?
        if session.canLoadObjects(ofClass: UIImage.self) {
            if imageView.frame.contains(location) {
                dropOperation = .copy
                print("copy")
            } else {
                dropOperation = .cancel
            }
        } else {
            dropOperation = .forbidden
        }
        return UIDropProposal(operation: dropOperation!)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction,
                         performDrop session: UIDropSession) {
        if session.canLoadObjects(ofClass: UIImage.self) {
            session.loadObjects(ofClass: UIImage.self) {
                (items) in
                if let images = items as? [UIImage] {
                    if self.sepiaFilter {
                        let sepiaImage = self.convertToSepia(image: images.last!)
                        self.imageView.image = sepiaImage
                    } else {
                        self.imageView.image = images.last!
                    }
                }
            }
        }
    }
    
    func convertToSepia(image: UIImage) -> UIImage {
        let sepiaFilter = CIFilter(name: "CISepiaTone")
        let cimage = CIImage(image: image)
        sepiaFilter?.setDefaults()
        sepiaFilter?.setValue(cimage, forKey: "inputImage")
        sepiaFilter?.setValue(NSNumber(value: 0.8 as Float), forKey: "inputIntensity")
        let image = sepiaFilter?.outputImage
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(image!, from: image!.extent)
        return UIImage(cgImage: cgImage!)
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning
        session: UIDragSession) -> [UIDragItem] {
        if let textView = interaction.view as? UITextView {
            let provider = NSItemProvider(object:
                textView.text! as NSString)
            let item = UIDragItem(itemProvider: provider)
            return [item]
        } else if let imageView = interaction.view as?
            UIImageView {
            guard let image = imageView.image else { return
                [] }
            let provider = NSItemProvider(object: image)
            let item = UIDragItem(itemProvider: provider)
            return [item]
        }
        return []
    }
    
    func dragInteraction(_ interaction:UIDragInteraction, previewForLifting item:UIDragItem, session:UIDragSession)
        -> UITargetedDragPreview? {
        let dragView = interaction.view!
        let dragPoint = session.location(in: dragView)
        let target = UIDragPreviewTarget(container: dragView, center: dragPoint)
        if (dragView as? UITextView) != nil {
            return UITargetedDragPreview(view: dragView)
        } else if let currentView = dragView as?
            UIImageView {
            let previewImageView = UIImageView(image: scaleImage(image: currentView.image!, width: 100))
            return UITargetedDragPreview(view:
                previewImageView, parameters:UIDragPreviewParameters(), target:target)
        }
        return nil
    }
    func scaleImage (image: UIImage, width: CGFloat) -> UIImage {
        let oldWidth = image.size.width
        let scaleFactor = width / oldWidth
        let newHeight = image.size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        image.draw(in: CGRect(x:0, y:0, width:newWidth, height:newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, willAnimateLiftWith
        animator: UIDragAnimating, session: UIDragSession) {
        animator.addAnimations {
            interaction.view?.alpha = 0.5
        }
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, item: UIDragItem, willAnimateCancelWith animator: UIDragAnimating) {
        animator.addAnimations {
            interaction.view?.alpha = 1.0
        }
    }
    
    func dragInteraction(_ interaction: UIDragInteraction, session: UIDragSession, didEndWith operation:
        UIDropOperation) {
        interaction.view?.alpha = 1.0
    }
    
   


}

