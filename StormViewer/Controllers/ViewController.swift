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
}

