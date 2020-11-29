import UIKit
import SDWebImage

class DetailViewController: UIViewController {
  var info: Images?
  @IBOutlet weak var dpImg: UIImageView!
  @IBOutlet weak var descriptionTxtVw: UITextView!
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = false
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    displayData()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = true
  }
  @IBAction func backBtn(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  func displayData() {
    navigationItem.title = info?.title
    dpImg.sd_setImage(with: URL(string: info?.image ?? "") , placeholderImage: #imageLiteral(resourceName: "placeholder"), options: .retryFailed, completed: nil)
    descriptionTxtVw.text = info?.description
  }
}
