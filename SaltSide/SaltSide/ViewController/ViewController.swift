//
//  ViewController.swift
//  SaltSide
//
//  Created by Akash Sidhwani on 29/11/20.
//
import UIKit
import SDWebImage
class ViewController: UIViewController {

  @IBOutlet weak var tblList: UITableView!
  
  let viewModel = ImagesVM()
  override func viewDidLoad() {
    super.viewDidLoad()
    getImages()
  }
  func getImages() {
    viewModel.getImages { (success, msg) in
      if success {
        self.tblList.reloadData()
      } else {
        // show alert
      }
    }
  }
}
// Mark: Table Delegate and Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.imagesDataList.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let dic = viewModel.imagesDataList[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ImagesTVC
    cell?.displayData(dic)
    return cell!
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let dic = viewModel.imagesDataList[indexPath.row]
    moveToZoomView(dic)
  }
}
// Mark: Routing
extension ViewController {
  func moveToZoomView(_ dic: Images) {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
    vc?.info = dic
    self.navigationController?.pushViewController(vc!, animated: true)
  }
}
