//
//  ViewController.swift
//  StormViewer
//
//  Created by Jinwook Kim on 2021/05/18.
//

import UIKit

class ViewController: UITableViewController {
    var pictures: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Storm Viewer"
        let fileManager: FileManager = FileManager()
        let path: String = Bundle.main.resourcePath!
        let items: [String] = try! fileManager.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                self.pictures.append(item)
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = self.pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = self.storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            // Three of them might fail. That's why we set it as an optional.
            viewController.selectedImage = pictures[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
