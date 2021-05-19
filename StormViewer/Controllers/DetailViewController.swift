//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Jinwook Kim on 2021/05/19.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String? // Because it will start as nil.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = UINavigationItem.LargeTitleDisplayMode.never // or just .never
        self.title = self.selectedImage
        if let imageToLoad: String = self.selectedImage {
            self.imageView.image = UIImage(named: imageToLoad)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.hidesBarsOnTap = false
    }
}
