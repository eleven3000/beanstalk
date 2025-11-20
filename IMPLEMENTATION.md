# Beanstalk: Implementation Plan

This document outlines the phased implementation plan for the Beanstalk app.

## Journal

This section will be updated chronologically after each phase to log actions taken, things learned, surprises, and any deviations from the plan.

*   **Phase 1 (Setup):** *Completed.* All initial project setup tasks are done. All required dependencies were already present in `pubspec.yaml`, and the directory structure was created as per `DESIGN.md`. A minimal `lib/main.dart` was created to make the project runnable. The initial commit has been made. A persistent issue with the `launch_app` tool prevented the app from being launched through the tool, but a manual `flutter run -d windows` command was successful.
*   **Phase 2 (Core Models & Data Layer):** *Completed.* All data models (`User`, `Post`, `Cafe`, `Comment`, `Tag`, `PostTag`) were created with `json_serializable` annotations. `build_runner` was executed to generate part files. Abstract repository interfaces and mock data sources were implemented. Concrete repository implementations were created using the mock data sources. Unit tests for data models were created and passed. `dart_fix` and `dart_format` were run.
*   **Phase 3 (Authentication):** *Completed.* Implemented the full authentication flow, including `AuthRepository`, `AuthUseCase`, `AuthViewModel`, and the `LoginView` and `RegisterView` screens. Integrated the `AuthViewModel` with `go_router` for automatic redirection and state-based navigation. Created unit tests for the authentication layer.

---

## The Plan

After completing a task, if you added any TODOs to the code or didn't fully implement anything, make sure to add new tasks so that you can come back and complete them later.

### Phase 1: Project Setup & Foundation

*   [x] Create the Flutter package `beanstalk` in `C:\src\beanstalk` using the `create_project` tool with the `empty` template.
*   [x] Change the working directory to `C:\src\beanstalk`.
*   [x] Add necessary dependencies to `pubspec.yaml` using the `pub` tool:
    *   `provider`
    *   `go_router`
    *   `http` (or `dio`)
    *   `json_serializable`
    *   `json_annotation`
    *   `google_maps_flutter`
    *   `geolocator`
    *   `image_picker`
    *   `cached_network_image`
    *   `build_runner` (as a dev dependency)
*   [x] Remove the boilerplate `lib/main.dart` and the `test/` directory.
*   [x] Update the `description` in `pubspec.yaml` to "A social app for cafe lovers." and set the `version` to `0.1.0`.
*   [x] Create a placeholder `README.md` with a short description.
*   [x] Create `CHANGELOG.md` with an entry for `0.1.0 - Initial release`.
*   [x] Create the directory structure as defined in `DESIGN.md`.
*   [x] **Post-Phase Checklist:**
    *   [x] Run `dart pub get`.
    *   [x] Create an initial commit: "Initial project setup and configuration".
    *   [x] Get user approval for the commit message.
    *   [x] Commit the changes.
    *   [~] Start the app using `launch_app` on the preferred device. (Note: Tool failed, manual launch successful).
    *   [x] Update the Journal in this document.

### Phase 2: Core Models & Data Layer

*   [x] Create the data model files under `lib/src/data/models/` for `user.dart`, `post.dart`, `cafe.dart`, `comment.dart`, and `tag.dart`.
*   [x] Implement the classes with `json_serializable` annotations as per `DESIGN.md`.
*   [x] Run `dart run build_runner build` to generate the `.g.dart` files.
*   [x] Define the abstract repository interfaces in `lib/src/domain/repositories/`.
*   [x] Create mock implementations of the data sources in `lib/src/data/datasources/` that return hardcoded data. This will allow UI development to proceed without a live backend.
*   [x] Implement the repositories in `lib/src/data/repositories/`, using the mock data sources.
*   [x] **Post-Phase Checklist:**
    *   [x] Create unit tests for the data models (serialization/deserialization).
    *   [x] Run `dart_fix --apply`.
    *   [x] Run `analyze_files` and fix any issues.
    *   [x] Run all tests to ensure they pass.
    *   [x] Run `dart_format .`.
    *   [x] Update the Journal in this document.
    *   [x] Use `git diff` to review changes and create a commit message.
    *   [x] Get user approval for the commit message.
    *   [x] Commit the changes.
    *   [ ] If the app is running, `hot_reload` to see changes.

### Phase 3: Authentication

*   [x] Implement the `AuthViewModel` in `lib/src/presentation/auth/viewmodel/`.
*   [x] Create the login and registration screens (`login_view.dart`, `register_view.dart`) in `lib/src/presentation/auth/view/`.
*   [x] Connect the UI to the `AuthViewModel` to handle user input and state changes (loading, error, success).
*   [x] Implement the `AuthUseCase` in the domain layer and connect it to the (mock) `AuthRepository`.
*   [x] Update the `go_router` configuration to handle authentication logic (e.g., redirecting unauthenticated users to the login screen).
*   [x] **Post-Phase Checklist:** (Same as Phase 2)
    *   [x] Create unit tests for authentication.
    *   [x] Run `dart_fix --apply`.
    *   [x] Run `analyze_files` and fix any issues.
    *   [x] Run all tests to ensure they pass.
    *   [x] Run `dart_format .`.
    *   [ ] Update the Journal in this document.
    *   [ ] Use `git diff` to review changes and create a commit message.
    *   [ ] Get user approval for the commit message.
    *   [ ] Commit the changes.
    *   [ ] If the app is running, `hot_reload` to see changes.

### Phase 4: Feed & Post Creation

*   [ ] Implement the `FeedViewModel`.
*   [ ] Create the `FeedView` to display a `ListView.builder` of posts.
*   [ ] Implement the `PostViewModel` for creating and viewing posts.
*   [ ] Create the `PostCreateView` with fields for title, description, and an image picker.
*   [ ] Use `image_picker` to allow users to select photos.
*   [ ] Implement the upload logic in the (mock) `PostRepository` and `PostRemoteDataSource`.
*   [ ] **Post-Phase Checklist:** (Same as Phase 2)

### Phase 5: Social Features (Likes & Comments)

*   [ ] Add like functionality to the `Post` widget in the feed, with optimistic updates.
*   [ ] Implement the `CommentViewModel`.
*   [ ] Create the `CommentView` to display a list of comments for a post and an input field to add a new comment.
*   [ ] **Post-Phase Checklist:** (Same as Phase 2)

### Phase 6: User Profiles

*   [ ] Implement the `ProfileViewModel`.
*   [ ] Create the `ProfileView` to display user information, a grid of their posts, and follow/unfollow buttons.
*   [ ] **Post-Phase Checklist:** (Same as Phase 2)

### Phase 7: Finalization & Polish

*   [ ] Create a comprehensive `README.md` file for the package.
*   [ ] Create a `GEMINI.md` file in the project directory that describes the app, its purpose, and implementation details.
*   [ ] Conduct a full app review for UI/UX polish and bug fixes.
*   [ ] Ask the user to inspect the app and the code and say if they are satisfied.
*   [ ] **Post-Phase Checklist:** (Same as Phase 2, final commit)

### Phase 8 (Follow-up): Map View

*   [ ] Implement the `MapViewModel`.
*   [ ] Create the `MapView` with the `google_maps_flutter` widget.
*   [ ] Use `geolocator` to get the user's current location and center the map.
*   [ ] Fetch cafe locations and display them as markers. Implement clustering for posts at the same cafe.
*   [ ] **Post-Phase Checklist:** (Same as Phase 2)