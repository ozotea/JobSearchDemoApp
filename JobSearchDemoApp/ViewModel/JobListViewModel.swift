//
//  JobListViewModel.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation
import Combine

@MainActor
final class JobListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var state: ViewState<[Job]> = .idle

    private var jobs: [Job] = []
    private let repository: JobRepositoryProtocol

    init(repository: JobRepositoryProtocol) {
        self.repository = repository
    }

    var filteredJobs: [Job] {
        guard !searchText.isEmpty else {
            return jobs
        }
        return jobs.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
            ||
            $0.company.localizedCaseInsensitiveContains(searchText)
        }
    }

    func loadJobs() async {
        state = .loading
        do {
            let jobs = try await repository.fetchJobs()
            self.jobs = jobs
            if jobs.isEmpty {
                state = .empty
            } else {
                state = .success(jobs)
            }

        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
