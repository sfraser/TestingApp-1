//
//  ViewController.swift
//  TestingApp
//
//  Created by Perry Fraser on 6/9/17.
//  Copyright © 2017 Perry Fraser. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var projects = ["UITableView"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        
        return projects.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Project",
                                                      for: indexPath) as! ProjectCollectionViewCell
        let project = projects[indexPath.item]
        let tapRecognizer = ProjectTapGestureRecognizer(target: self, action: #selector(openProjectViewController(gesture:)))
        tapRecognizer.projectName = project
        
        
        cell.projectLabel.text = project
        cell.addGestureRecognizer(tapRecognizer)
        
        
        return cell
        
    }
    
    @objc func openProjectViewController(gesture: ProjectTapGestureRecognizer) {
        self.performSegue(withIdentifier: gesture.projectName!, sender: self)
    }

}

class ProjectTapGestureRecognizer: UITapGestureRecognizer {
    var projectName: String?
}
