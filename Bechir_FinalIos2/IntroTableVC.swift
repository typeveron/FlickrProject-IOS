//
//  IntroTableVC.swift
//  Bechir_FinalIos2
//
//  Created by Mobile Apps on 2020-02-19.
//  Copyright © 2020 Bechir Mihoub. All rights reserved.
//

import UIKit



class IntroTableVC: UITableViewController {
    
    
    @IBOutlet weak var segFilter: UISegmentedControl!
    
    
   var users = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchApiData()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    func fetchApiData() {
        let jsonUrlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
               guard let url = URL(string: jsonUrlString) else { return }
               
               URLSession.shared.dataTask(with: url) { (data, response, err) in
                   
                   
                   guard let data = data else { return }
                   
                   DispatchQueue.main.async {
                      
                   
                   do {
                     
                       
                       let media = try JSONDecoder().decode(User.self, from: data)
                       
                       self.users = media.items
                       print("****\(self.users)")
                       self.tableView.reloadData()
                 
                       
                   } catch let jsonErr {
                       print("Error serializing json:", jsonErr)
                   }
               }
                   
                   
                   }.resume()
               
               
              
           }
        
    
    
    @IBAction func segTapped(_ sender: UISegmentedControl) {
        if segFilter.selectedSegmentIndex == 0 {
        users.removeAll()
        fetchApiData()
        navigationItem.leftBarButtonItem?.isEnabled = false
        tableView.reloadData()
        
    }
        if segFilter.selectedSegmentIndex == 1 {
        users.removeAll()
        if let savedItems = Item.loadItems(){
           users = savedItems
        
           navigationItem.leftBarButtonItem?.isEnabled = true
           
           tableView.reloadData()                    }
        
        }
    }

    
    @IBAction func timeToSave(_ sender: UIBarButtonItem) {
        Item.saveItems(users)
        print("Items are saved")
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("*****:\(users.count)")
        return users.count
    }
    


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celly", for: indexPath) as! TableCell
        let item = users[indexPath.row]
        cell.update(with: item)
        cell.showsReorderControl = true

        return cell
    }


      override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
          let movedItem = users.remove(at: fromIndexPath.row)
              users.insert(movedItem, at: to.row)
              tableView.reloadData()
       
      }
      
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            // Remove object from Model
            users.remove(at: indexPath.row)
            
            // Remove corresponent row from TableView and update the UI
            // Because of this method we do not need tableView.reloadData() any more
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }else if editingStyle == .insert{
            // Create a new instance and insert it
        }
      
      
    }

  

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    // Check if EditEmoji segue is running pass the model object
    // related to selected cell
    if segue.identifier == "goDetail" {
        
        // Which cell is selected ........................
        let indexPath = tableView.indexPathForSelectedRow!
        let item = users[indexPath.row]
        //................................................
        
        // Create a reference to next VC which is the first VC of UINavigationController
        let navVC = segue.destination as! UINavigationController
        let detailTableVC = navVC.viewControllers.first as! DetailTableVC
        //................................................
        
        // Pass selected Object to target VC
        detailTableVC.item = item
    }
}
//---------------------------------------------

}
