//
//  ViewController.swift
//  HackwichFour
//
//  Created by Marion Ano on 2/28/19.
//  Copyright © 2019 Marion Ano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//declare our array

  
    var myFriends = ["Kapolei Kalapawai"]
    
    var restrantImageDate = [String]()


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return myFriends.count
        //return 4

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Code Block
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        let text = myFriends[indexPath.row]
        cell.textLabel?.text=text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        let dich = NSDictionary(contentsOfFile: path!)
        
        restrantImageDate = dich!.object(forKey: "restrantImages") as! [String]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"
        {
            let s1 = segue.destination as! detailViewController
            let imageIndex = tableView.indexPathForSelectedRow?.row
            s1.imagePass = restrantImageDate[imageIndex!]
        }
    }

}

