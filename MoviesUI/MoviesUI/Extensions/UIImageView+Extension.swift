//
//  UIImage+Extension.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import UIKit
import SDWebImage

extension UIImageView{
    func imgLoad(imageUrl url: String){
        sd_setImage(with: URL(string: url))
    }
}
