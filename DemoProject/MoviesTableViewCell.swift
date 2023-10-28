//
//  MoviesTableViewCell.swift
//  DemoProject
//
//  Created by Govind Sen on 28/10/23.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moviesImageView: UIImageView!
    @IBOutlet weak var HeadingLabel: UILabel!
    @IBOutlet weak var subHeadingLable: UILabel!
    
    var movie: Movie? {
        didSet { // Property Observer
            self.movieDetailConfiguration()
            
        }
    }
    
    func movieDetailConfiguration() {
        guard let movie else { return }
        HeadingLabel.text = movie.title
        subHeadingLable.text = movie.year
        moviesImageView.setImage(with: movie.poster ?? "")
    }
    
    
    
}

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
