//
//  JobListViewModelTests.swift
//  JobSearchDemoAppTests
//
//  Created by Soumya on 12/06/26.
//

import Foundation
import XCTest
@testable import JobSearchDemoApp

@MainActor
final class JobListViewModelTests: XCTestCase {

    func testLoadJobsSuccess() async {

        let repository = MockJobRepository()

        repository.jobs = [
            Job(
                id: 1,
                title: "iOS Engineer",
                company: "Apple",
                location: "Remote",
                salary: "$120k-$150k",
                description: "Test Description"
            )
        ]

        let viewModel = JobListViewModel(
            repository: repository
        )

        await viewModel.loadJobs()

        switch viewModel.state {
        case .success(let jobs):
            XCTAssertEqual(jobs.count, 1)

        default:
            XCTFail("Expected success state")
        }
    }

    func testLoadJobsEmpty() async {

        let repository = MockJobRepository()

        repository.jobs = []

        let viewModel = JobListViewModel(
            repository: repository
        )

        await viewModel.loadJobs()

        switch viewModel.state {
        case .empty:
            XCTAssertTrue(true)

        default:
            XCTFail("Expected empty state")
        }
    }

    func testLoadJobsError() async {

        let repository = MockJobRepository()

        repository.shouldThrowError = true

        let viewModel = JobListViewModel(
            repository: repository
        )

        await viewModel.loadJobs()

        switch viewModel.state {
        case .error:
            XCTAssertTrue(true)

        default:
            XCTFail("Expected error state")
        }
    }

    func testSearchByCompany() async {

        let repository = MockJobRepository()

        repository.jobs = [
            Job(
                id: 1,
                title: "iOS Engineer",
                company: "Apple",
                location: "Remote",
                salary: "$120k-$150k",
                description: "Test"
            ),
            Job(
                id: 2,
                title: "Backend Engineer",
                company: "Amazon",
                location: "Bangalore",
                salary: "$100k-$130k",
                description: "Test"
            )
        ]

        let viewModel = JobListViewModel(
            repository: repository
        )

        await viewModel.loadJobs()

        viewModel.searchText = "Apple"

        XCTAssertEqual(
            viewModel.filteredJobs.count,
            1
        )
    }
}
