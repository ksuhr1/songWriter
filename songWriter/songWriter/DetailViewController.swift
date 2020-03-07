//
//  DetailViewController.swift
//  songWriter
//
//  Created by Katelyn Suhr on 3/7/20.
//  Copyright © 2020 Katelyn Suhr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songContent: UITextView!
    
    var song: Song?
    
    var name: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTitle.text = name
//        print("songTitle text" + songTitle.text!)
        
//        songTitle.text = song?.title
//        songContent.text = song?.content

        // Do any additional setup after loading the view.
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
