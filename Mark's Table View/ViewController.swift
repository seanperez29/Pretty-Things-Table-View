//
//  ViewController.swift
//  Mark's Table View
//
//  Created by Sean Perez on 4/25/16.
//  Copyright © 2016 Awsome. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var uglyThings = ["http://cs7054.vk.me/c540107/v540107076/b2c0/jlZwOToqAeY.jpg", "http://thelibertarianrepublic.com/wp-content/uploads/2015/11/stars-750x400.jpg", "https://s-media-cache-ak0.pinimg.com/736x/65/55/81/655581f9ff7a03bc2c60d6d317cb65b8.jpg", "http://0e33611cb8e6da737d5c-e13b5a910e105e07f9070866adaae10b.r15.cf1.rackcdn.com/Jim-Rittenburg-Wide-angle-sky-1_1390156664_lg.jpg", "http://media.mlive.com/kzgazette_impact/photo/mwtsp2002-1jpg-56e10c5de9606498.jpg"]
    
    var uglyTitles = ["Amazing!", "Oh MG!", "I like", "Okay, ya that's nice", "Doesn't get much better"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("UglyCell") as? UglyCell {
            
            var img: UIImage!
            
            let url = NSURL(string: uglyThings[indexPath.row])!
            if let data = NSData(contentsOfURL: url) {
                img = UIImage(data: data)
            } else {
                img = UIImage(named: "sean")
            }
            
            cell.configureCell(img, text: uglyTitles[indexPath.row])
            
            return cell
        } else {
        
        return UglyCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uglyThings.count
    }

}

