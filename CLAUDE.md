# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter News Toolkit is a news application template co-sponsored by VGV, Flutter, and the Google News Initiative. It provides a complete Flutter mobile app and Dart Frog API backend, implementing common news app features, Firebase integrations, ads, and subscriptions.

**Key Technologies:**
- Flutter 3.38.3+ / Dart SDK >=3.10.0
- Dart Frog for API server
- BLoC for state management
- Firebase (auth, notifications, deep links, analytics, crashlytics)
- Very Good CLI for tooling

**Official Documentation:** https://vgventures.github.io/news_toolkit/

## Repository Structure

```
news_toolkit/
├── flutter_news_example/        # Main Flutter app
│   ├── lib/                     # App source (feature-based folders)
│   ├── test/                    # Tests (mirrors lib/ structure)
│   ├── api/                     # Dart Frog API server
│   │   ├── routes/              # API endpoints
│   │   ├── lib/                 # Shared API logic
│   │   └── packages/news_blocks/ # Content block definitions
│   └── packages/                # Independent packages (20+)
│       ├── *_repository/        # Data layer (news, user, article, etc.)
│       ├── *_client/            # Platform integrations
│       ├── app_ui/              # Shared UI components and theme
│       ├── news_blocks_ui/      # Content rendering widgets
│       └── storage/             # Storage abstractions
├── docs/                        # Docusaurus documentation site
└── tool/generator/              # Template generator
```

## Code Generation with Mason

The project includes Mason CLI bricks for generating common patterns. See `bricks/README.md` for details.

**Install Mason:**
```bash
dart pub global activate mason_cli
mason get
```

**Available bricks:**
- `feature_bloc` - Create BLoC-based feature
- `repository` - Create repository package
- `client` - Create abstract client interface
- `client_implementation` - Create concrete client implementation
- `storage` - Create storage abstraction
- `package` - Create basic Flutter package

**Example usage:**
```bash
mason make feature_bloc --feature_name settings
mason make repository --repository_name comments
```

## Development Commands

### Flutter App (from `flutter_news_example/`)

**Install dependencies:**
```bash
flutter pub global activate very_good_cli
very_good packages get --recursive
```

**Run app:**
```bash
# Development flavor (localhost API)
flutter run lib/main/main_development.dart

# Production flavor
flutter run lib/main/main_production.dart
```

**Format code:**
```bash
dart format --set-exit-if-changed lib test
```

**Analyze code:**
```bash
flutter analyze lib test
```

**Run tests:**
```bash
# All tests with coverage
very_good test -x presubmit-only --coverage --test-randomize-ordering-seed random

# Run coverage script (requires 100% coverage)
./tool/coverage.sh

# Run single test file
flutter test test/path/to/test_file.dart
```

**Verify generated files are committed:**
```bash
flutter test ./test/ensure_build_test.dart --run-skipped
```

### API Server (from `flutter_news_example/api/`)

**Run locally:**
```bash
dart_frog dev  # Runs on localhost:8080
```

**Build for production:**
```bash
dart_frog build
```

**Run tests:**
```bash
dart test --coverage=coverage
very_good test --coverage
```

**Format and analyze:**
```bash
dart format --set-exit-if-changed routes lib test
dart analyze routes lib test
```

### Individual Packages (from package directory)

Packages use standard Flutter/Dart commands:
```bash
flutter pub get          # Install dependencies
flutter test --coverage  # Run tests with coverage
dart format lib test     # Format code
flutter analyze lib test # Analyze code
```

## Architecture Patterns

### Multi-Package Architecture

The app uses a **multi-package monorepo** with clear separation of concerns:

- **Repositories**: High-level data access APIs that combine clients and business logic
  - Example: `news_repository`, `user_repository`, `article_repository`

- **Clients**: Low-level platform/service integrations with abstract interfaces
  - Pattern: `authentication_client/` contains abstract interface
  - `firebase_authentication_client/` provides Firebase implementation
  - Same pattern for `notifications_client`, `deep_link_client`

- **Storage**: Persistence abstractions
  - `storage/` - abstract interface
  - `persistent_storage/` - SharedPreferences implementation
  - `secure_storage/` - Flutter Secure Storage implementation
  - `token_storage/` - In-memory auth token storage

### State Management

**BLoC Pattern** is used throughout:
- Each feature has a `bloc/` folder with events, states, and bloc
- Use `flutter_bloc` widgets: `BlocProvider`, `BlocBuilder`, `BlocListener`
- `HydratedBloc` for persisted state (theme, user preferences)

### App Initialization

The bootstrap pattern initializes dependencies:
1. `main_development.dart` or `main_production.dart` entry points
2. Calls `bootstrap()` from `lib/main/bootstrap/bootstrap.dart`
3. Bootstrap initializes Firebase, storage, repositories
4. Repositories/clients injected into `App` widget via constructor
5. `App` provides them down via `RepositoryProvider` and `BlocProvider`

### Feature Organization

Each feature in `lib/` follows this structure:
```
feature_name/
├── bloc/           # State management
├── view/           # UI screens
├── widgets/        # Reusable widgets for this feature
└── feature_name.dart  # Barrel export file
```

### API Structure

Dart Frog API uses file-based routing:
- `routes/` folder structure maps to URL paths
- Middleware in `routes/_middleware.dart`
- Shared models in `api/packages/news_blocks/`
- `news_blocks` defines content block types (text, image, video, etc.)

## Testing Requirements

**100% test coverage is required** for all PRs to be approved.

**Coverage excludes:**
- Generated files: `**/*.g.dart`, `**/*.gen.dart`
- Localization: `**/l10n/*.dart`, `**/l10n/**/*.dart`
- Bootstrap: `**/main/bootstrap.dart`

**Testing tools:**
- `mocktail` for mocking
- `bloc_test` for testing BLoCs
- `mockingjay` for navigation testing
- `mocktail_image_network` for testing image loading

**Test randomization:** Tests must pass with `--test-randomize-ordering-seed random`

**Tag exclusion:** Use `-x presubmit-only` to exclude presubmit-only tests during development

## Code Generation

Several packages use code generation:

**JSON serialization:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Files with `@JsonSerializable()` generate `*.g.dart` files.

**Always commit generated files** - CI verifies this with `ensure_build_test.dart`

## Commit Conventions

Use [conventional commits](https://www.conventionalcommits.org/):
- `feat:` - New feature
- `fix:` - Bug fix
- `chore:` - Dependencies, imports, format changes
- `build:` - Build system or external dependencies
- `ci:` - CI configuration changes
- `docs:` - Documentation only
- `perf:` - Performance improvements
- `refactor:` - Code change that neither fixes a bug nor adds a feature
- `style:` - Code style changes (whitespace, formatting)
- `test:` - Adding or correcting tests

## Key Implementation Details

### Firebase Integration

Firebase services are initialized in bootstrap and used via clients:
- **Auth**: `FirebaseAuthenticationClient` wraps Firebase Auth
- **Notifications**: `FirebaseNotificationsClient` wraps Firebase Messaging
- **Deep Links**: `FirebaseDeepLinkClient` wraps Firebase Dynamic Links
- **Analytics**: Direct Firebase Analytics integration in `analytics_repository`
- **Crashlytics**: Integrated in bootstrap for error reporting

### News Content Blocks

Content is represented as typed blocks defined in `news_blocks` package:
- `TextBlock`, `ImageBlock`, `VideoBlock`, `DividerBlock`, etc.
- Rendered by corresponding widgets in `news_blocks_ui` package
- Allows flexible, structured content from API
- Each block type has JSON serialization

### Localization

Uses Flutter's ARB-based localization:
- ARB files in `lib/l10n/`
- Configuration in `l10n.yaml`
- Generated files excluded from coverage
- Access via `context.l10n` (from `app_ui` package)

### Environment Flavors

Two flavors with separate entry points:
- **Development**: `main_development.dart` - connects to localhost:8080 API
- **Production**: `main_production.dart` - connects to production API

Configure API endpoint in respective main file via `FlutterNewsExampleApiClient`

### Navigation

Uses `flow_builder` package for declarative navigation:
- Routes defined in `lib/app/routes/routes.dart`
- Navigation state managed by `AppBloc`
- Deep linking integrated via `DeepLinkService`

## Common Workflows

### Adding a New Feature

1. Create feature folder in `lib/` with bloc, view, widgets
2. Add barrel export file
3. Wire up in app routes if needed
4. Add tests mirroring lib structure
5. Ensure 100% coverage
6. Commit generated files if any

### Adding a New Package

1. Create package in `flutter_news_example/packages/`
2. Add to `pubspec.yaml` dependencies with path reference
3. Run `very_good packages get --recursive`
4. Follow abstract interface pattern if multiple implementations needed
5. Ensure 100% test coverage

### Modifying the API

1. Update routes in `api/routes/`
2. Update models in `api/packages/news_blocks/` if needed
3. Run code generation if using JSON serialization
4. Update API client in main app to use new endpoints
5. Update `api/docs/api.apib` documentation

### Running Documentation Site

From `docs/` directory:
```bash
npm install
npm start  # Development server
npm run build  # Production build
```
