//
//  JobServiceProtocol.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation

protocol JobServiceProtocol {
    func fetchJobs() async throws -> [Job]
}

final class JobService: JobServiceProtocol {
    func fetchJobs() async throws -> [Job] {
        try await Task.sleep(for: .seconds(1))
        guard let url = Bundle.main.url(
            forResource: "jobs",
            withExtension: "json"
        ) else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Job].self, from: data)
    }
}
