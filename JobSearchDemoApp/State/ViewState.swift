//
//  ViewState.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation

enum ViewState<T> {
    case idle
    case loading
    case success(T)
    case empty
    case error(String)
}
