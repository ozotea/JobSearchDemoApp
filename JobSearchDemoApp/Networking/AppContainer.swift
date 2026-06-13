//
//  AppContainer.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation

final class AppContainer {
    lazy var service: JobServiceProtocol = {
        JobService()
    }()

    lazy var repository: JobRepositoryProtocol = {
        JobRepository(service: service)
    }()
}
