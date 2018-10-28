//
//  COGestureImageView.swift
//  Consequat
//
//  Created by Quentin CLEMENT on 28/10/2018.
//  Copyright © 2018 Quentin CLEMENT. All rights reserved.
//

import UIKit

class COGestureImageView: UIImageView {
    
    func addPanPinchRotateGestures() {
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        
        let moveGesture = UIPanGestureRecognizer(target: self, action: #selector(move(gesture:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(gesture:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate(gesture:)))
        
        for gesture in [moveGesture, pinchGesture, rotateGesture] as [UIGestureRecognizer] {
            gesture.delegate = self
            self.addGestureRecognizer(gesture)
        }
    }
    
    // MARK: - Target Gestures
    
    @objc func move(gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .began || gesture.state == .changed {
            
            guard let inView = COAppEnvironment.shared().routing?.visibleViewController()?.view,
                let draggableView = gesture.view else {return}
            
            let translation = gesture.translation(in: inView)
            draggableView.center = CGPoint(x: draggableView.center.x + translation.x, y: draggableView.center.y + translation.y)
            gesture.setTranslation(CGPoint.zero, in: inView)
        }
    }
    
    @objc func pinch(gesture: UIPinchGestureRecognizer) {
        
        if gesture.state == .began || gesture.state == .changed {
            guard let pinchableView = gesture.view else {return}
            pinchableView.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
        }
    }
    
    @objc func rotate(gesture: UIRotationGestureRecognizer) {
        
        if gesture.state == .began || gesture.state == .changed {
            guard let rotatableView = gesture.view else {return}
            rotatableView.transform = CGAffineTransform(rotationAngle: gesture.rotation)
        }
    }

}

extension COGestureImageView: UIGestureRecognizerDelegate {
 
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
