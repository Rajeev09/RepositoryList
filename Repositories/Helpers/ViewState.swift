//
//  ViewState.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import Foundation

enum ViewState: Equatable {
    case Loading
    case Loaded
    case Error(Error)
}

func ==(lhs: ViewState, rhs: ViewState) -> Bool {
    switch (lhs, rhs) {
    case (.Loaded, .Loaded):
        return true
    case (.Loading, .Loading):
        return true
    case (.Error, .Error):
        return true
    default:
        return false
    }
}

