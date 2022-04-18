//
//  ViewController.swift
//  Repositories
//
//  Created by Rajeev on 17/04/22.
//

import UIKit


class RepositoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIImageView!
    
    let viewModel = RepositoryListViewModel(networkManager: NetworkManager.shared)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.setupBinding()
        self.viewModel.fetchRepositories()
    }
    
    private func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.separatorColor = .lightGray
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.registerCell(RepositoryCell.self)
    }
    
    private func setupBinding() {
        viewModel.viewState.bind = { [weak self] state in
            guard let self = self else { return }
            self.render(state: state)
        }
    }
}

extension RepositoryListViewController {
    func render(state: ViewState) {
        self.errorView.isHidden = true
        switch state {
        case .Loading:
            break
        case .Loaded:
            self.tableView.reloadData()
        case .Error:
            self.errorView.isHidden = false
        }
    }
}
