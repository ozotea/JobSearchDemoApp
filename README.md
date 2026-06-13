//
//  Untitled.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

# JobSearchDemoApp

## Overview

JobSearchDemoApp is a SwiftUI-based iOS application that allows users to browse available jobs, search jobs by title or company, and view detailed job information.

The application was built as part of an iOS Technical Assessment and follows modern iOS development practices including MVVM architecture, dependency injection, async/await, and unit testing.

---

## Features

### Job Listing

* Display available jobs
* Show:

  * Job Title
  * Company Name
  * Location
  * Salary Range

### Search

* Search jobs by:

  * Job Title
  * Company Name

### Job Details

* View:

  * Job Description
  * Company Information
  * Salary Range
  * Location

### State Management

* Loading State
* Empty State
* Error State

---

## Architecture

The application follows the MVVM (Model-View-ViewModel) architecture pattern.

### Layers

#### Presentation Layer

Responsible for UI rendering and user interaction.

* JobListView
* JobDetailView
* JobListViewModel
* JobDetailViewModel

#### Domain Layer

Contains business models and repository contracts.

* Job
* JobRepositoryProtocol

#### Data Layer

Responsible for data retrieval and persistence.

* JobService
* JobRepository
* Local JSON Data Source

---

## Dependency Injection

Dependencies are injected through initializers to improve testability and separation of concerns.

Example:

```swift
init(repository: JobRepositoryProtocol)
```

---

## Async Programming

The application uses Swift Concurrency (async/await) for asynchronous operations.

Example:

```swift
let jobs = try await repository.fetchJobs()
```

---

## Project Structure

```text
JobSearchDemoApp
│
├── JobSearchDemoApp.xcodeproj
│
├── JobSearchDemoApp
│   ├── JobSearchDemoAppApp.swift
│   ├── Model
│   │   └── Job.swift
│   ├── Networking
│   │   └── AppContainer.swift
│   ├── Repository
│   │   └── JobRepository.swift
│   ├── Services
│   │   └── JobServiceProtocol.swift
│   ├── State
│   │   └── ViewState.swift
│   ├── ViewModel
│   │   ├── JobListViewModel.swift
│   │   └── JobDetailViewModel.swift
│   ├── View
│   │   ├── JobListView.swift
│   │   ├── JobRowView.swift
│   │   └── JobDetailView.swift
│   ├── Assets.xcassets
│   └── jobs.json
│
├── JobSearchDemoAppTests
│   ├── JobListViewModelTests.swift
│   ├── JobSearchDemoAppTests.swift
│   └── MockJobRepository.swift
│
└── JobSearchDemoAppUITests
    ├── JobSearchDemoAppUITests.swift
    └── JobSearchDemoAppUITestsLaunchTests.swift
```

---

## Setup Instructions

### Requirements

* Xcode 16+
* iOS 17+
* Swift 5.9+

### Installation

1. Clone the repository

```bash
git clone https://github.com/ozotea/JobSearchDemoApp.git
```

2. Open the project

```bash
JobSearchDemoApp.xcodeproj
```

3. Build and Run

Press:

⌘ + R

---

## Running Tests

Run all tests:

⌘ + U

or

Product → Test

---

## Test Coverage

Unit tests are included for:

* JobListViewModel
* Repository Layer
* Search Functionality
* Error Handling
* Empty State Handling

---

## Assumptions

* Job data is loaded from a local JSON file.
* Search functionality is performed client-side.
* Authentication is not required.
* Network layer abstraction has been designed to allow easy migration to a remote API in the future.
* The application targets iOS 17 and above.

---

## Author

Submitted as part of the JobSearchDemoApp iOS Technical Assessment.

