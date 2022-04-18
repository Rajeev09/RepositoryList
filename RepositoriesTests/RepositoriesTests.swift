//
//  RepositoriesTests.swift
//  RepositoriesTests
//
//  Created by Rajeev on 17/04/22.
//

import XCTest
@testable import Repositories

class RepositoriesTests: XCTestCase {

    var viewModel: RepositoryListViewModel?
    let mockDataSource = MockDataSource()
    let firstModel = RepositoryModel(id: 31792824, name: "flutter", owner: RepositoryOwner(name: "flutter", imageUrl: "https://avatars.githubusercontent.com/u/14101776?v=4"), description: "Flutter makes it easy and fast to build beautiful apps for mobile and beyond.", language: "Dart", forksCount: 16944, starGazersCount: 118700)
    
    override func setUpWithError() throws {
        viewModel = RepositoryListViewModel(repositoryDataSource: mockDataSource)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchRepositoriesSuccess() {
        viewModel?.fetchRepositories(forceFetch: true)
        XCTAssertEqual(viewModel?.viewState.value, .Loading)
        mockDataSource.fetchMockForSuccessState()
        XCTAssertGreaterThan(viewModel?.cellModels.count ?? 0, 0)
        XCTAssertEqual(viewModel?.viewState.value, .Loaded)
    }
    
    func testFetchRepositoriesFailure() {
        viewModel?.fetchRepositories(forceFetch: true)
        XCTAssertEqual(viewModel?.viewState.value, .Loading)
        mockDataSource.fetchMockFail(error: MockDataError.parsingFailed)
        XCTAssertEqual(viewModel?.cellModels.count ?? 0, 0)
        XCTAssertEqual(viewModel?.viewState.value, .Error(MockDataError.parsingFailed))
    }
    
    func testGetRepositoryCellModelCount() {
        viewModel?.fetchRepositories(forceFetch: true)
        mockDataSource.fetchMockForSuccessState()
        XCTAssertEqual(viewModel?.getRepositoryCellModelCount() ?? 0, 3)
    }
    
    func testGetRepositoryCellModelAtIndex() {
        viewModel?.fetchRepositories(forceFetch: true)
        mockDataSource.fetchMockForSuccessState()
        XCTAssertEqual(viewModel?.getRepositoryCellModel(index: 0), RepositoryCellViewModel(repositoryModel: firstModel))
    }
    
    func testSetCollapsibleState() {
        viewModel?.fetchRepositories(forceFetch: true)
        mockDataSource.fetchMockForSuccessState()
        viewModel?.setCollapsibleState(index: 0)
        XCTAssertEqual(viewModel?.cellModels[0].hasCollapsed, false)
        viewModel?.setCollapsibleState(index: 0)
        XCTAssertEqual(viewModel?.cellModels[0].hasCollapsed, true)
    }
    
    
}
