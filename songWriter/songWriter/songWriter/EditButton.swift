//
//  EditButton.swift
//  songWriter
//
//  Created by Katelyn Suhr on 3/8/20.
//  Copyright © 2020 Katelyn Suhr. All rights reserved.
//

import UIKit

class EditButton: UIButton {
    var isOn = false
    let fullCheck = UIImage(named:"fullCheck") as UIImage?
    let emptyCheck = UIImage(named:"emptyCheck") as UIImage?
    
    override  init(frame: CGRect) {
        super.init(frame:frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton(){
        setImage(emptyCheck, for: .normal)
//        layer.borderWidth  = 1.0
//        layer.borderColor = Colors.black.cgColor
//        layer.cornerRadius = frame.size.height
        addTarget(self, action: #selector(EditButton.buttonPressed), for: .touchUpInside)
        
    }
    
    @objc func buttonPressed(){
        
        print("buttonPressed")
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool:Bool) {
        print("activateButton")
        isOn = bool
//        let color = bool ? Colors.darkerGreen :.clear
//        backgroundColor = color
        setImage(fullCheck, for: .normal)
        
    }

}
