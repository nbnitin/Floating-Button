//
//  FloatingButton.swift
//  FloatingDraggableButton
//
//  Created by Nitin Bhatia on 27/03/23.
//

import UIKit

@IBDesignable
class FloatingButton: UIButton {
    
    private var panGesture : UIPanGestureRecognizer!

    override func awakeFromNib() {
        //call any function to customize button
        setFloatingGesture()
    }
    
    @IBInspectable override var isEnabled : Bool {
        didSet {
            if isEnabled {
                //do something
            } else {
               //do something
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        isEnabled = isEnabled
    }

    private func setFloatingGesture() {
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(moveButton(_:)))
        addGestureRecognizer(panGesture)
    }
    
    @objc func moveButton(_ sender : UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        
        
        
        if let x = sender.view?.center.x, let y = sender.view?.center.y, let statusBarHeight = superview?.window?.windowScene?.statusBarManager?.statusBarFrame.height, let center = CGPoint(x: translation.x + x, y: translation.y + y) as? CGPoint, center.y > statusBarHeight {
           
            self.center = center
           
            sender.setTranslation(.zero, in: self)
        }
        
       
        
        
    }
}
