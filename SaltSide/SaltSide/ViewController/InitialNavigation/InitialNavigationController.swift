import UIKit
class InitialNavigationController: UINavigationController {
  static let shared = InitialNavigationController()
  override func viewDidLoad() {
    super.viewDidLoad()
    let backButtonImage = #imageLiteral(resourceName: "backBlack")
    navigationBar.backIndicatorImage = backButtonImage
    navigationBar.backIndicatorTransitionMaskImage = backButtonImage
    navigationBar.barTintColor = .white
    navigationBar.tintColor = .white
    navigationBar.shadowImage = UIImage()
  }
}
