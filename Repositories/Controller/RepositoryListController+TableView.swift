//
//  RepositoryListController+TableView.swift
//  Repositories
//
//  Created by Rajeev on 17/04/22.
//

import UIKit
import SkeletonView

extension RepositoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getRepositoryCellModelCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(RepositoryCell.self, indexPath: indexPath)
        cell.configure(viewModel: self.viewModel.getRepositoryCellModel(index: indexPath.row))
        return cell
    }
}


extension RepositoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.setCollapsibleState(index: indexPath.row)
        self.viewModel.viewState.value = .Loaded
    }
}

extension RepositoryListViewController: SkeletonTableViewDataSource {
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return String(describing: RepositoryCell.self)
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        let cell = skeletonView.dequeueReusableCell(RepositoryCell.self, indexPath: indexPath)
        return cell
    }

}
