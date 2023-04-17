//
//  ViewController.swift
//  MoviesUI
//
//  Created by OMER on 7.12.2022.
//

import UIKit
import Lottie

final class MainViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var presenter: MainPresenterProtocol?
    private var movies: [MoviePresentation] = []
    var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        animationSetupUI()
    }
    
    

    
    @IBAction func searchChange(_ sender: UITextField) {
        let searchValue = sender.text
        if let searchValue = searchValue{
            if searchValue.count >= 3{
                if let presenter = presenter{
                    presenter.load(paramaters: searchValue.lowercased())
                }
            }
            else{
                self.movies = []
                movieTableView.reloadData()
            }
        }
    }
}
// MARK: Movie View Protocol
extension MainViewController: MainViewProtocol{
    func handleOutput(_ output: MainMoviePresenterOutput) {
        switch output{
        case .setLoading(let loading):
            self.loading(status: loading)
        case .showMovie(let movies):
            self.movies = movies
            movieTableView.reloadData()
        }
    }
}

// MARK: Table View Defaults
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count > 0 ? movies.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if movies.count == 0 {
            let cell = movieTableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyDataTableViewCell
            return cell
        }else{
            let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
            let movie = movies[indexPath.row]
            cell.movieImage.imgLoad(imageUrl: movie.img)
            cell.title.text = movie.title
            cell.subTitle.text = movie.subTitle
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieTableView.deselectRow(at: indexPath, animated: false)
        presenter?.selectMovie(at: indexPath.row)
    }
}

// MARK: View - SubView
extension MainViewController{
    func animationSetupUI(){
        animationView = .init(name: "loadingCircle")
        animationView?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView!.center = self.view.center
        animationView!.loopMode = .loop
        animationView!.contentMode = .scaleAspectFit
        view.addSubview(animationView!)
        animationView?.isHidden = true
    }
    
    func loading(status: Bool){
        if status{
            animationView?.isHidden = false
            animationView!.play()
        }
        else{
            self.animationView!.removeFromSuperview()
        }
    }
}
