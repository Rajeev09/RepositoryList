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
    
    private lazy var dataSource = RepositoryDataSource(networkManager: NetworkManager.shared)
    lazy var viewModel = RepositoryListViewModel(repositoryDataSource: dataSource)
    var refreshControl: UIRefreshControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trending"
        self.setUpTableView()
        self.setRefreshControl()
        self.setupBinding()
        self.viewModel.fetchRepositories(forceFetch: true)
    }
    
    private func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 80
        self.tableView.separatorColor = .lightGray
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.registerCell(RepositoryCell.self)
        self.tableView.isHidden = true
    }
    
    private func setRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.refreshControl = refreshControl
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refresh(_ sender: Any) {
        self.viewModel.fetchRepositories(forceFetch: true)
    }
    
    private func setupBinding() {
        viewModel.viewState.bind = { [weak self] state in
            guard let self = self else { return }
            self.render(state: state)
        }
    }
    
}

//MARK: Skeleton
extension RepositoryListViewController {
    
    func showSkeletonForView() {
        tableView.isHidden = false
        view.showHDAnimatedGradientSkeleton()
    }
    
    func hideSkeletonForView() {
        tableView.isHidden = false
        view.hideSkeleton()
    }
    
}

extension RepositoryListViewController {
    func render(state: ViewState) {
        self.errorView.isHidden = true
        switch state {
        case .Loading:
            self.showSkeletonForView()
        case .Loaded:
            self.hideSkeletonForView()
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        case .Error:
            self.errorView.isHidden = false
        }
    }
}
