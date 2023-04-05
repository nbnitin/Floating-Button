//
//  MainTabBarViewController.swift
//  FloatingDraggableButton
//
//  Created by Nitin Bhatia on 05/04/23.
//

import UIKit


class MainTabBarViewController: UITabBarController {
    
    let FLOATING_BUTTON_SIZE : CGFloat = 50
    let FLOATING_BUTTON_MARGIN : CGFloat = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        addFloatingButton()
    }
    

    private func addFloatingButton() {
        let floatButton = FloatingButton()
        floatButton.awakeFromNib()
        floatButton.frame.size = CGSize(width: FLOATING_BUTTON_SIZE, height: FLOATING_BUTTON_SIZE)
        floatButton.frame.origin = CGPoint(x: view.bounds.maxX - (FLOATING_BUTTON_SIZE + FLOATING_BUTTON_MARGIN), y: view.bounds.maxY - (FLOATING_BUTTON_SIZE + FLOATING_BUTTON_MARGIN))
        floatButton.autoresizingMask = [.flexibleTopMargin,.flexibleRightMargin]
        floatButton.layer.cornerRadius = floatButton.frame.width / 2
        let largeConfig = UIImage.SymbolConfiguration(pointSize: FLOATING_BUTTON_SIZE, weight: .regular, scale: .medium)
        let largeBoldDoc = UIImage(systemName: "pencil.circle.fill", withConfiguration: largeConfig)
        floatButton.setImage(largeBoldDoc, for: .normal)
        view.addSubview(floatButton)
        floatButton.addTarget(self, action: #selector(floatingButtonAction(_:)), for: .touchUpInside)
    }
    
    
    @objc private func floatingButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Hello", message: "Here I am...", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
   

}
