//
//  DetailViewController.swift
//  songWriter
//
//  Created by Katelyn Suhr on 3/7/20.
//  Copyright © 2020 Katelyn Suhr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
  
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songContent: UITextView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var song: Song?
    
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTitle.text = name
        songContent.text = "Write your lyrics"
        
//        songTitle.text = song?.title
//        songContent.text = song?.content

        // Do any additional setup after loading the view.
//        update()
    }
    
    
    @IBAction func initialUpdateSong(_ sender: UIButton) {
        print("Wanting to add content to song")
        let content = songContent?.text
        if content != nil
        {
            self.appDelegate.initialUpdateSong(title: songTitle.text!, content: content!)
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


