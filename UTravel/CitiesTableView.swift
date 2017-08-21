//
//  CitiesTableView.swift
//  UTravel
//
//  Created by Dennis Li on 8/16/17.
//  Copyright © 2017 Lidennis62. All rights reserved.
//

import Foundation
import UIKit


class CitiesTableView : UITableViewController {
    var row_selected = Int()
    var cities = [String]()
    var identities = [String]()
    override func viewDidLoad() {
        
        cities = ["Portland", "Los Angeles", "Seattle"]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel!.text = cities[indexPath.row]  //index path is the specific cell ranging from 0 to the maximum number of cells
        
        return cell!
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        row_selected = indexPath.row
        print("changed")
    }*/
    
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TableView Called")
        row_selected = indexPath.row
       
        performSegue(withIdentifier: "ShowMap", sender: self)
        //This function ensures that the segue is called after selecting a specfic row.
        
    }
 

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Segue Called")
        let SecondController = segue.destination as! ViewController
        SecondController.row_selected = row_selected
    }
    

    
    
}
