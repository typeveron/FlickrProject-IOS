//
//  DetailTableVC.swift
//  Bechir_FinalIos2
//
//  Created by Mobile Apps on 2020-02-20.
//  Copyright © 2020 Bechir Mihoub. All rights reserved.
//

import UIKit

class DetailTableVC: UITableViewController {
    
    
    @IBOutlet weak var theImage: UIImageView!
    
    @IBOutlet weak var itemTitle: UILabel!
    
    @IBOutlet weak var theAuthor: UILabel!
    
    @IBOutlet weak var pub: UILabel!
    
    
    var item : Item?
    
    let storeItemController = FetchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       itemTitle.text = item?.title
       theAuthor.text = item?.author
       pub.text = item?.published
       theImage.image = UIImage(named: "Grey")
       storeItemController.fetchItemArtwork(url: (item?.media.m)!) {
           (image) in
           if let image = image {
               DispatchQueue.main.async {
                   self.theImage.image = image
               }
           }
       }
        
    }



  

}
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    

