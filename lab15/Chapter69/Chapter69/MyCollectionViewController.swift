//  Name: Yunyan Shi
//  Lab 15
//
//  MyCollectionViewController.swift
//  Chapter69
//
//  Created by Yunyan Shi on 12/1/19.
//  Copyright © 2019 Yunyan Shi. All rights reserved.
//

import UIKit

let reuseIdentifier = "MyCell"

class MyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var imageFiles = [String]()
    var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let myLayout = MyFlowLayout()
        self.collectionView?.setCollectionViewLayout(myLayout, animated: true)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        self.collectionView?.addGestureRecognizer(pinchRecognizer)
        
        initialize()

        // Register cell classes
        
    }
    
    func initialize() {
        imageFiles = ["chevy_small.jpg",
                      "mini_small.jpg",
                      "rover_small.jpg",
                      "smart_small.jpg",
                      "highlander_small.jpg",
                      "venza_small.jpg",
                      "volvo_small.jpg",
                      "vw_small.jpg",
                      "ford_small.jpg",
                      "nissan_small.jpg",
                      "honda_small.jpg",
                      "jeep_small.jpg"]
        for fileName in imageFiles {
            if let image = UIImage(named: fileName) {
                images.append(image)
            }
        }
    }
    
    @objc func handlePinch(gesture: UIPinchGestureRecognizer) {
        let layout = self.collectionView?.collectionViewLayout as! MyFlowLayout
        if gesture.state == UIGestureRecognizer.State.began {
            // Get the initial location of the pinch?
            let initialPinchPoint = gesture.location(in: self.collectionView)
            // Convert pinch location into a specific cell
            if let pinchedCellPath = self.collectionView?.indexPathForItem(at: initialPinchPoint) {
                // Store the indexPath to cell
                layout.currentCellPath = pinchedCellPath as NSIndexPath
            }
        }
        else if gesture.state == UIGestureRecognizer.State.changed {
            // Store the new center location of the selected cell
            layout.currentCellCenter = gesture.location(in: self.collectionView)
            // Store the scale value
            layout.setCurrentCellScale(scale: gesture.scale)
        } else {
            self.collectionView?.performBatchUpdates({
                layout.currentCellPath = nil
                layout.currentCellScale = 1.0},completion:nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = images[indexPath.row]
        return image.size
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let myLayout = UICollectionViewFlowLayout()
//        myLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
//        self.collectionView?.setCollectionViewLayout(myLayout, animated: true)
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header: MySupplementaryView?
        if kind == UICollectionView.elementKindSectionHeader {
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MyHeader", for: indexPath) as? MySupplementaryView
            header?.headerLabel.text = "Car Image Gallery"
            
        }
        return header!
    }
    
    

}
