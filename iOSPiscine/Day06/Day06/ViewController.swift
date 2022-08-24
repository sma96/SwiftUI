//
//  ViewController.swift
//  Day06
//
//  Created by 마석우 on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    var lastRotation: CGFloat = 0
    var dynamicAnimator = UIDynamicAnimator()
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    var itemBehaviour = UIDynamicItemBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [])
        collision = UICollisionBehavior(items: [])
        itemBehaviour = UIDynamicItemBehavior(items: [])
        
        collision.translatesReferenceBoundsIntoBoundary = true
        gravity.magnitude = 0.006
        itemBehaviour.elasticity = 0.6
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapped(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        dynamicAnimator.addBehavior(collision)
        dynamicAnimator.addBehavior(gravity)
        dynamicAnimator.addBehavior(itemBehaviour)
    }

    @objc func didTapped(_ sender: UIGestureRecognizer) {
        let location = sender.location(in: self.view)
        let x: CGFloat = location.x
        let y: CGFloat = location.y
        let size = CGFloat.random(in: 50...100)
        let demoView = ShapeView(frame: CGRect(x: x, y: y, width: size, height: size))
        
        demoView.isUserInteractionEnabled = true
        demoView.clipsToBounds = true
        self.view.addSubview(demoView)
        
        gravity.addItem(demoView)
        collision.addItem(demoView)
        itemBehaviour.addItem(demoView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(_:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateGesture(_:)))
        
        panGesture.delaysTouchesEnded = false
        pinchGesture.delaysTouchesEnded = false
        rotateGesture.delaysTouchesEnded = false
        
        demoView.addGestureRecognizer(pinchGesture)
        demoView.addGestureRecognizer(panGesture)
        demoView.addGestureRecognizer(rotateGesture)
        print("Tapped")
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        
        guard let piece = sender.view else {
            return
        }
        switch sender.state {
        case .began:
            gravity.removeItem(piece)
        case .changed:
            piece.center = sender.location(in: self.view)
            dynamicAnimator.updateItem(usingCurrentState: piece)
        case .ended:
            gravity.addItem(piece)
            
        default:
            break
        }
    }
    
    @objc func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        guard let piece = sender.view else {
            return
        }
        
        switch sender.state {
        case .began:
            gravity.removeItem(piece)
        case .changed:
            piece.bounds.size.width *= sender.scale
            piece.bounds.size.height *= sender.scale
            if piece.layer.cornerRadius != 0 {
                piece.layer.cornerRadius *= sender.scale
            }
            dynamicAnimator.updateItem(usingCurrentState: piece)
            sender.scale = 1.0
        case .ended:
            gravity.addItem(piece)
        default:
            break
        }
    }
    
    @objc func rotateGesture(_ sender: UIRotationGestureRecognizer) {
        guard let piece = sender.view else {
            return
        }
        
        switch sender.state {
        case .began:

            gravity.removeItem(piece)
        case .changed:
            piece.transform = CGAffineTransform(rotationAngle: sender.rotation)
            dynamicAnimator.updateItem(usingCurrentState: piece)
        case .ended:
            gravity.addItem(piece)

        default:
            break
        }
        
    }
    
}
