//
//  ButtonAnimation.swift
//  2nd
//
//  Created by Maxim Soloboev on 05.03.2023.
//

import UIKit

extension UIButton {

    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.93, y: 0.93))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            button.transform = transform
        })
    }
}
