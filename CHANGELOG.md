# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-02-07

### Added
- Initial release of rjrpaz.server_management collection
- Migrated `ilo` role from standalone role to collection format
- Added comprehensive CI/CD pipeline with GitHub Actions
- Added support for multiple Ansible versions (4.x, 5.x, 6.x)
- Added collection testing and linting

### Changed
- **BREAKING**: Variable names now use `ilo_` prefix for consistency:
  - `installer_directory` → `ilo_installer_directory`
  - `firmware_package` → `ilo_firmware_package`
  - `ilo` → `ilo_versions`
- Updated minimum Ansible version requirement to 2.15.0
- Converted repository structure to Ansible collection format

### Fixed
- Improved variable naming following Ansible best practices
- Fixed YAML formatting and indentation issues
- Added required Galaxy tags for better discoverability
- Fixed all ansible-lint violations for production compliance

### Documentation
- Comprehensive README with usage examples
- Local development guide with Docker and Make
- Testing and CI/CD documentation
- Troubleshooting section
- Migration guide from standalone role
- Contributing guidelines

[1.0.0]: https://github.com/rjrpaz/ansible-role-ilo/releases/tag/v1.0.0