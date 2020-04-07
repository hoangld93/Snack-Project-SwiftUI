//
//  ObservableState.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 4/3/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import ReSwift

public class ObservableState<T>: ObservableObject where T: StateType {

    // MARK: Public properties
    
    @Published public var current: T
    
    // MARK: Private properties
    
    private var store: Store<T>
    
    // MARK: Lifecycle
    
    public init(store: Store<T>) {
        self.store = store
        self.current = store.state
        
        store.subscribe(self)
    }
    
    deinit {
        store.unsubscribe(self)
    }
    
    // MARK: Public methods
    
    public func dispatch(_ action: Action) {
        store.dispatch(action)
    }
    
//    public func dispatch(_ action: Action) -> () -> Void {
//        {
//            self.store.dispatch(action)
//        }
//    }
}


extension ObservableState: StoreSubscriber {
    
    // MARK: - <StoreSubscriber>
    
    public func newState(state: T) {
        DispatchQueue.main.async {
            self.current = state
        }
    }
}
