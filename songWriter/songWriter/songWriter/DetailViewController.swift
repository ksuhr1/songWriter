//
//  DetailViewController.swift
//  songWriter
//
//  Created by Katelyn Suhr on 3/7/20.
//  Copyright © 2020 Katelyn Suhr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController , UITextFieldDelegate{
    
  
  
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var editTitle: UITextField!
    
    @IBOutlet weak var songContent: UITextView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        songTitle.text = name
        songContent.text = ""
        
        editTitle.delegate = self
        editTitle.isHidden = true
        songTitle.isUserInteractionEnabled = true
//        let titleTapGesture = UITapGestureRecognizer(target: self, action: #selector(lablTapped(recognizer:)))
//        titleTapGesture.numberOfTapsRequired = 1
//        songTitle.addGestureRecognizer(titleTapGesture)
        
        let contentTapGesture = UITapGestureRecognizer(target: self, action: #selector(lablTapped(recognizer:)))
        contentTapGesture.numberOfTapsRequired = 2
        songContent.addGestureRecognizer(contentTapGesture)
        
    }
    
    @objc func lablTapped (recognizer: UITapGestureRecognizer)
    {
        print("labelIsTapped")
        
        songTitle.isHidden = true
        editTitle.isHidden = false
        editTitle.text = songTitle.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        editTitle.isHidden = true
        songTitle.isHidden = false
        songTitle.text = editTitle.text
        return true
    }
    
    
    @IBAction func initialUpdateSong(_ sender: UIButton) {
        textFieldShouldReturn(editTitle)
        songContent.tintColor = UIColor.clear
        print("Wanting to add content to song")
        let content = songContent?.text
        let title = songTitle?.text
        if title != nil && content != nil
        {
            self.appDelegate.initialUpdateSong(title: title!, content: content!)
        }
       
    }
    
     
//
//    func update()
//    {
//        print("In update function")
//
////        var contentTextField: UITextField?
//        let content = songContent?.text
//        print(content)
//

        
//
//        let title = titleTextField?.text
//        let content = contentTextField?.text
                
//        if content != nil
//        {
//            self.appDelegate.initialUpdateSong(title: title!, content: content!)
////            self.fetchAndUpdateTable()
//        }
                
               
  
        
//        //Create Cancel button with action handler
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
//            print("Cancel button tapped")
//        }
//        //Add OK and Cancel button to dialog message
//        dialogMessage.addAction(ok)
//        dialogMessage.addAction(cancel)
//
//        //Add Input TextField to dialog message
//        dialogMessage.addTextField { (textField) -> Void in
//
//            titleTextField = textField
//            titleTextField?.placeholder = "Type in your song title"
//            titleTextField?.text = song.title
//
//        }
//
//        dialogMessage.addTextField { (texField) -> Void in
//
//            contentTextField = texField
//            contentTextField?.placeholder = "Write your lyrics"
//            contentTextField?.text = song.content
//        }
//
//        //Present dialog messageee to user
//        self.present(dialogMessage, animated: true, completion: nil)
        
    }

   
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


