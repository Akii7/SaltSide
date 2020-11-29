//
//  ImagesTVC.swift
//  SaltSide
//
//  Created by Akash Sidhwani on 29/11/20.
//
import UIKit

class ImagesTVC: UITableViewCell {

  @IBOutlet weak var dpImg: UIImageView!
  @IBOutlet weak var titleLbl: UILabel!
  @IBOutlet weak var descriptionLbl: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
  func displayData(_ dic: Images) {
    dpImg.sd_setImage(with: URL(string: dic.image ?? "") , placeholderImage: #imageLiteral(resourceName: "placeholder"), options: .retryFailed, completed: nil)
    titleLbl.text = dic.title
    descriptionLbl.text = dic.description
  }
}
