//
//  MockJobRepository.swift
//  JobSearchDemoAppTests
//
//  Created by Soumya on 12/06/26.
//

import Foundation
@testable import JobSearchDemoApp

final class MockJobRepository: JobRepositoryProtocol {

    var jobs: [Job] = []
    var shouldThrowError = false

    func fetchJobs() async throws -> [Job] {

        if shouldThrowError {
            throw URLError(.badServerResponse)
        }

        return jobs
    }
}
