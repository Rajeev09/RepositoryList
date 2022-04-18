//
//  RepositoryListController+TableView.swift
//  Repositories
//
//  Created by Rajeev on 17/04/22.
//

import UIKit

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
