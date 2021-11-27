//
//  MovieListTableViewCell.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 23/11/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var borderView: UIView!
    
    private var movie: Movie?
    private var imageDownloadRequest: DataRequest?
    
    override func awakeFromNib() {
        self.borderView.layer.cornerRadius = 4.0
        self.borderView.layer.borderColor = UIColor.black.cgColor
        self.borderView.layer.borderWidth = 0.5
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterImageView.image = nil
        self.voteAverageLabel.text = ""
        self.imageDownloadRequest?.cancel()
        self.imageDownloadRequest = nil
        
    }
    func configure(with movie: Movie) {
        self.movie = movie
        self.titleLabel.text = movie.title
        self.titleLabel.sizeToFit()
        self.yearLabel.text = movie.yearOfMovie()
        if let voteAverage = movie.voteAverage, voteAverage > 0 {
            self.voteAverageLabel.text = String(voteAverage)
        }
        self.downloadImage()
    }
    
    func downloadImage() {
        guard let posterPath = self.movie?.posterPath else {
            return
        }
        
        let imageURL = MovieConstants.posterImageURLString(with: posterPath)
        self.imageDownloadRequest = AF.request(imageURL)
            .responseImage { response in
                if case .success(let image) = response.result {
                    self.posterImageView.image = image
                }
            }
    }
}

extension UIView {

  func dropShadow() {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: -1, height: 1)
      layer.shadowRadius = 1
      layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = UIScreen.main.scale
  }
}
