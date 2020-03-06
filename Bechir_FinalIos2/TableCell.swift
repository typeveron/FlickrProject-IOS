//
//  TableCell.swift
//  Bechir_FinalIos2
//
//  Created by Mobile Apps on 2020-02-19.
//  Copyright © 2020 Bechir Mihoub. All rights reserved.
//

import UIKit


class TableCell: UITableViewCell {
    
    
    let storeItemController = FetchController()
    
    
    @IBOutlet weak var theImage: UIImageView!
    
    @IBOutlet weak var theAuthor: UILabel!
    
    @IBOutlet weak var theDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with item: Item) {
        theAuthor.text = item.author
        theDate.text = item.date_taken
        theImage.image = UIImage(named: "Grey")
        storeItemController.fetchItemArtwork(url: item.media.m) {
            (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.theImage.image = image
                }
            }
        }
    }
    




    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

   


