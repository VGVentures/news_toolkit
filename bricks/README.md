# Flutter News Toolkit - Mason Bricks

This directory contains Mason bricks (code generation templates) for creating common patterns used throughout the Flutter News Toolkit.

## Prerequisites

Install Mason CLI:

```bash
dart pub global activate mason_cli
```

## Getting Started

From the repository root, get the bricks:

```bash
mason get
```

This will register all bricks defined in `mason.yaml`.

## Available Bricks

### 1. feature_bloc

Creates a complete feature with BLoC state management pattern.

**Generates:**
- `lib/{feature_name}/` directory with:
  - `bloc/` - Event, State, and BLoC files
  - `view/` - Page and View widgets
  - `widgets/` - Feature-specific widgets
  - Barrel export file

**Usage:**
```bash
mason make feature_bloc
```

**Example:**
```bash
mason make feature_bloc --feature_name profile
```

**Generated structure:**
```
lib/profile/
├── bloc/
│   ├── profile_bloc.dart
│   ├── profile_event.dart
│   └── profile_state.dart
├── view/
│   ├── profile_page.dart
│   └── view.dart
├── widgets/
│   └── widgets.dart
└── profile.dart
```

### 2. repository

Creates a repository package following the repository pattern.

**Generates:**
- Complete Flutter package with:
  - Repository class
  - Models directory
  - Tests
  - README and pubspec.yaml

**Usage:**
```bash
mason make repository
```

**Example:**
```bash
mason make repository --repository_name comments
```

**Where to use:** In `flutter_news_example/packages/` for data layer packages.

### 3. client

Creates an abstract client interface package.

**Generates:**
- Abstract client class
- Base failure class
- Models directory
- Tests and package configuration

**Usage:**
```bash
mason make client
```

**Example:**
```bash
mason make client --client_name analytics
```

**Where to use:** In `flutter_news_example/packages/` for creating service abstractions.

### 4. client_implementation

Creates a concrete implementation of a client (e.g., Firebase, OneSignal).

**Generates:**
- Concrete client class extending abstract client
- Implementation-specific failure class
- Tests
- Package configuration with dependency on abstract client

**Usage:**
```bash
mason make client_implementation
```

**Example:**
```bash
# For Firebase Analytics implementation
mason make client_implementation --implementation_name firebase --client_name analytics
```

**Where to use:** In `flutter_news_example/packages/{client_name}_client/` alongside the abstract client.

### 5. storage

Creates a storage abstraction for persisting data.

**Generates:**
- Storage class wrapping the base Storage interface
- Example CRUD methods (commented)
- Tests with mocked storage
- Package configuration

**Usage:**
```bash
mason make storage
```

**Example:**
```bash
mason make storage --storage_name comments
```

**Where to use:** In `flutter_news_example/packages/storage/` for domain-specific storage.

### 6. package

Creates a basic Flutter package scaffold.

**Generates:**
- Package structure with lib, test directories
- README, pubspec.yaml, analysis_options.yaml
- Basic class and test

**Usage:**
```bash
mason make package
```

**Example:**
```bash
mason make package --package_name video_player --package_description "Video player utilities"
```

**Where to use:** In `flutter_news_example/packages/` for any new package.

## Common Workflows

### Creating a New Feature

1. Generate the feature:
   ```bash
   cd flutter_news_example
   mason make feature_bloc --feature_name my_feature
   ```

2. Move generated code to the lib directory if needed

3. Add to app routing in `lib/app/routes/routes.dart`

4. Write tests in `test/my_feature/`

### Creating a New Repository

1. Generate the repository package:
   ```bash
   cd flutter_news_example/packages
   mason make repository --repository_name my_data
   ```

2. Add package to main app's `pubspec.yaml`:
   ```yaml
   dependencies:
     my_data_repository:
       path: packages/my_data_repository
   ```

3. Run `very_good packages get --recursive`

### Creating a Client with Implementation

1. Create abstract client:
   ```bash
   cd flutter_news_example/packages
   mason make client --client_name my_service
   ```

2. Create Firebase implementation:
   ```bash
   cd flutter_news_example/packages/my_service_client
   mason make client_implementation --implementation_name firebase --client_name my_service
   ```

3. Add both to main app's `pubspec.yaml`

4. Implement the abstract methods in the concrete implementation

## Best Practices

1. **Always run tests** after generating code:
   ```bash
   flutter test --coverage
   ```

2. **Format generated code**:
   ```bash
   dart format lib test
   ```

3. **Analyze for issues**:
   ```bash
   flutter analyze lib test
   ```

4. **Update barrel exports** when adding new files to generated features

5. **Follow naming conventions**:
   - snake_case for file and package names
   - PascalCase for class names
   - camelCase for variables

6. **Maintain 100% test coverage** - modify generated tests as needed

## Customizing Bricks

To customize a brick:

1. Navigate to the brick directory: `bricks/{brick_name}/`
2. Edit `brick.yaml` to add/modify variables
3. Edit templates in `__brick__/` directory
4. Use Mason syntax:
   - `{{variable_name}}` - Use variable
   - `{{variable_name.snakeCase()}}` - Transform to snake_case
   - `{{variable_name.pascalCase()}}` - Transform to PascalCase
   - `{{variable_name.camelCase()}}` - Transform to camelCase
   - `{{variable_name.titleCase()}}` - Transform to Title Case

5. Run `mason get` to refresh

## Additional Resources

- [Mason Documentation](https://github.com/felangel/mason)
- [Flutter News Toolkit Docs](https://vgventures.github.io/news_toolkit/)
- [BLoC Documentation](https://bloclibrary.dev)

## Troubleshooting

**Issue:** Mason command not found
- **Solution:** Ensure Mason CLI is installed and in your PATH:
  ```bash
  dart pub global activate mason_cli
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  ```

**Issue:** Generated code has import errors
- **Solution:** Run `flutter pub get` in the generated package directory

**Issue:** Tests fail after generation
- **Solution:** Generated tests are basic templates. Implement proper test logic based on your feature.
