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
}
