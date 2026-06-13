//
//  JobRepository.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation

protocol JobRepositoryProtocol {
    func fetchJobs() async throws -> [Job]
}

final class JobRepository: JobRepositoryProtocol {
    private let service: JobServiceProtocol
    init(service: JobServiceProtocol) {
        self.service = service
    }
    func fetchJobs() async throws -> [Job] {
        try await service.fetchJobs()
    }
}
