//
//  EditViewController.swift
//  songWriter
//
//  Created by Katelyn Suhr on 3/7/20.
//  Copyright © 2020 Katelyn Suhr. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
       

    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var editTitleLabel: UILabel!
    @IBOutlet weak var editContentView: UITextView!
    var song: Song?
     
       

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editTitleLabel.text = song?.title
        editContentView.text = song?.content


        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateSong(_ sender: Any) {
        print("Updating song")
        let songTitle = editTitleLabel?.text
        let content = editContentView?.text
        if song != nil && content != nil
        {
            self.appDelegate.updateSong(song: song!, title: songTitle!, content: content!)
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
