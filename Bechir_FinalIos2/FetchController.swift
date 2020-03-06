//
//  FetchControl.swift
//  Bechir_FinalIos2
//
//  Created by Mobile Apps on 2020-02-20.
//  Copyright © 2020 Bechir Mihoub. All rights reserved.
//

import Foundation
import UIKit



class FetchController {


func fetchItemArtwork(url: URL, completion: @escaping (UIImage?) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data,
            let image = UIImage(data: data) {
            completion(image)
        } else {
            completion(nil)
        }
    }
    
    task.resume()
}
}
