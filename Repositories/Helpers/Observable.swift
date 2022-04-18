//
//  Observable.swift
//  Repositories
//
//  Created by Rajeev on 18/04/22.
//

import Foundation

protocol ObservableProtocol {
    associatedtype T
    var value: T { get set }
    var bind: ((T) -> Void)? {get set}
}

public final class Observable<T>: ObservableProtocol {
    var bind: ((T) -> Void)? = {_ in}

    var value: T {
        didSet {
            bind?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

}
