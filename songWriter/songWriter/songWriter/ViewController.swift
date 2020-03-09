//
//  ViewController.swift
//  songWriter
//
//  Created by Katelyn Suhr on 3/6/20.
//  Copyright © 2020 Katelyn Suhr. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tblView: UITableView!
    var dataSourceArray = [Song]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var titleTextField: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillAppear(true)
        
        // Do any additional setup after loading the view.
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAndUpdateTable()
    }
    
    //DELETE FUNCTION
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            let song = dataSourceArray[indexPath.row]
            appDelegate.deleteSong(song: song )
            fetchAndUpdateTable()
        }
    }
    
    
    //new added method from second video
    //www.youtube.com/watch?v=v0Hx7q26Hoo
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showdetail"
//        {
//            if let destination = segue.destination as? DetailViewController {
//                destination.name = titleTextField!.text
//            }
//            
//        }
        if segue.identifier == "editdetail"
        {
            print("segue editdetail")
            if let destination = segue.destination as? EditViewController {
              destination.song = dataSourceArray[(tblView.indexPathForSelectedRow?.row)!]
              tblView.deselectRow(at: tblView.indexPathForSelectedRow!, animated: true)
              self.fetchAndUpdateTable()
            }

        }
        
       
//       
//            destination.name = titleTextField?.text

//            destination.song = dataSourceArray[(tblView.indexPathForSelectedRow?.row)!]
//            tblView.deselectRow(at: tblView.indexPathForSelectedRow!, animated: true)
        
    }
    
    
    //added function method
    //UPDATE FUNCTION
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        // different video added code
        performSegue(withIdentifier: "editdetail", sender: self)
        
        
//        let song = dataSourceArray[indexPath.row]
//        var titleTextField: UITextField?
//        var contentTextField: UITextField?
//        
//        //Declare AlertMessage
//        let dialogMessage = UIAlertController(title: "Alert Title", message: "Please update song name and content", preferredStyle: .alert)
//        
//        //Create OK button with actio nhandler
//        let ok = UIAlertAction(title: "Update", style: .default, handler:
//            {(action) -> Void in
//                let title = titleTextField?.text
//                let content = contentTextField?.text
//                
//                if title != nil && content != nil  {
//                    self.appDelegate.updateSong(song: song, title: title!, content: content!)
//                    self.fetchAndUpdateTable()
//                }
//                
//               
//        })
//        
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let song = dataSourceArray[indexPath.row]
        
        if cell ==  nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "songsTable")
        }
        
        cell?.textLabel?.text = song.title!
        return cell!
    }
    
    func fetchAndUpdateTable()
    {
        dataSourceArray =  appDelegate.fetchSongs()
        tblView.reloadData()
    }

    @IBAction func addSong(_ sender: UIButton)
    {
        //Declare AlertMessage
        let dialogMessage = UIAlertController(title: "Add a song", message: "Please choose a song title", preferredStyle: .alert)
        
        //Create OK button with actio nhandler
        let ok = UIAlertAction(title: "OK", style: .default, handler:
            {(action) -> Void in
                let title = self.titleTextField?.text

                let content = ""
                if title != nil && content != nil
                {
                   self.appDelegate.insertSong(title: title!, content:content)
                   self.fetchAndUpdateTable()
                }
        })
        
        //Create Cancel button with action handler
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        //Add Input TextField to dialog message
        dialogMessage.addTextField { (textField) -> Void in
            
            self.titleTextField = textField
            self.titleTextField?.placeholder = "Type in your song title"
        }

        //Present dialog messageee to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    }

}

