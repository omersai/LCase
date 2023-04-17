//
//  UIViewController+Extension.swift
//  MoviesUI
//
//  Created by OMER on 14.12.2022.
//

import UIKit

extension UIViewController{
    func alertDialog(title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
