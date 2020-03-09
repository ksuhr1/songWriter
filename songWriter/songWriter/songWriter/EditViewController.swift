//
//  EditViewController.swift
//  songWriter
//
//  Created by Katelyn Suhr on 3/7/20.
//  Copyright © 2020 Katelyn Suhr. All rights reserved.
//

import UIKit

class EditViewController: UIViewController,  UITextFieldDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
    @IBOutlet weak var editBtn: EditButton!
    @IBOutlet weak var editTitleLabel: UILabel!
    @IBOutlet weak var editContentView: UITextView!
    @IBOutlet weak var editTxtF: UITextField!
    let fullCheck = UIImage(named:"fullCheck") as UIImage?
    let emptyCheck = UIImage(named:"emptyCheck") as UIImage?
    
    var song: Song?
    var isOn = false

    override func viewDidLoad() {
        super.viewDidLoad()
        editTitleLabel.text = song?.title   //label
        editContentView.text = song?.content
        editContentView.isEditable = false
        
        

        editTxtF.delegate = self
        editTxtF.isHidden =  true
        editTitleLabel.isUserInteractionEnabled =  true
        let contentTapGesture = UITapGestureRecognizer(target: self, action: #selector(lablTapped(recognizer:)))
        contentTapGesture.numberOfTapsRequired =   2
        editContentView.addGestureRecognizer(contentTapGesture)
    }
    
    @objc func lablTapped (recognizer: UITapGestureRecognizer)
    {
        editTitleLabel.isHidden = true
        editTxtF.isHidden = false
        editTxtF.text = editTitleLabel.text
        
        editContentView.isEditable = true
        editContentView.isSelectable = true
        
        editContentView.tintColor = UIColor.systemBlue
        editContentView.endFloatingCursor()
        editBtn.setImage(emptyCheck, for: .normal)
        isOn = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          editTxtF.isHidden = true
          editTitleLabel.isHidden = false
          editTitleLabel.text = editTxtF.text
          return true
      }
    
    @IBAction func updateSong(_ sender: Any) {
        print("Updating song")
        if isOn == true
        {
            textFieldShouldReturn(editTxtF)
            let songTitle = editTitleLabel?.text
            let content = editContentView?.text
            if song != nil && content != nil
            {
                self.appDelegate.updateSong(song: song!, title: songTitle!, content: content!)
                editContentView.tintColor = UIColor.clear
            }
        }
        else{
           let songTitle = editTitleLabel?.text
           let content = editContentView?.text
           if song != nil && content != nil
           {
               self.appDelegate.updateSong(song: song!, title: songTitle!, content: content!)
               editContentView.tintColor = UIColor.clear
           }
            
        }
    
           
  
     
            
        
       
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
