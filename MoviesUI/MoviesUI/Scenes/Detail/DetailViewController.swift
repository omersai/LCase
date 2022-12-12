//
//  DetailViewController.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import UIKit
import FirebaseAnalytics

final class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?

    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var imdbText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let presenter = presenter{
            presenter.load()
        }
    }
}

extension DetailViewController: DetailViewProtocol{
    func update(_ presentation: DetailPresentation) {
        detailImg.imgLoad(imageUrl: presentation.img)
        imdbText.text = String(presentation.imdbPoint)
        dateText.text = presentation.dateText
        detailTitle.text = presentation.title
        detailText.text = presentation.subTitle
        
        func googleAnalyticLog(){
            Analytics.logEvent("movieDetail", parameters: [
                "title": presentation.title
            ])
        }
    }
}
