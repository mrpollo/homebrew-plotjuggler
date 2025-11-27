# homebrew-plotjuggler

[![CI](https://github.com/mrpollo/homebrew-plotjuggler/actions/workflows/tests.yml/badge.svg)](https://github.com/mrpollo/homebrew-plotjuggler/actions/workflows/tests.yml)

A Homebrew tap for [PlotJuggler](https://www.plotjuggler.io), the time series visualization tool.

## Overview

This tap provides a Homebrew formula for PlotJuggler, making it easy to install and manage PlotJuggler on macOS and Linux systems. PlotJuggler is a powerful tool for visualizing and analyzing time series data, commonly used in robotics, control systems, and data analysis.

**Upstream Project:** [facontidavide/PlotJuggler](https://github.com/facontidavide/PlotJuggler)

## Installation

### Quick Install

```bash
# Tap this repository
brew tap mrpollo/plotjuggler

# Install PlotJuggler
brew install plotjuggler
```

### One-line Install

```bash
brew install mrpollo/plotjuggler/plotjuggler
```

### Verify Installation

```bash
# Check version
plotjuggler --version

# Launch PlotJuggler
plotjuggler
```

## Bottle Support

Pre-compiled bottles are automatically built and distributed for:

- **macOS 13** (Ventura) - Intel
- **macOS 14** (Sonoma) - Apple Silicon
- **macOS 15** (Sequoia) - Apple Silicon
- **Ubuntu 22.04** - Linux x86_64

Bottles provide fast installation without needing to compile from source.

## Usage

### Basic Commands

```bash
# Update Homebrew and upgrade PlotJuggler
brew update
brew upgrade plotjuggler

# Uninstall PlotJuggler
brew uninstall plotjuggler

# Remove the tap
brew untap mrpollo/plotjuggler
```

### Build from Source

If you prefer to build from source instead of using bottles:

```bash
brew install --build-from-source plotjuggler
```

## Formula Information

**Current Version:** 3.14.1

**Dependencies:**
- cmake (build-time only)
- mosquitto
- protobuf
- qt@5
- zeromq

**License:** Apache-2.0

## Development

### Local Testing

To test formula changes locally:

```bash
# Clone the repository
git clone https://github.com/mrpollo/homebrew-plotjuggler.git
cd homebrew-plotjuggler

# Tap locally
brew tap mrpollo/plotjuggler "$PWD"

# Test the formula
brew install --verbose plotjuggler
brew test plotjuggler

# Audit the formula
brew audit --strict plotjuggler
```

### Contributing

Contributions are welcome! To contribute formula updates:

1. **Fork** this repository
2. **Create a branch** for your changes
3. **Update** the formula in `Formula/plotjuggler.rb`
4. **Test** your changes locally
5. **Submit a pull request**

The CI workflow will automatically:
- Run formula audits
- Test installation on multiple platforms
- Build bottles for all supported platforms

## CI/CD

### Automated Workflows

This repository uses GitHub Actions for continuous integration and delivery:

#### [tests.yml](.github/workflows/tests.yml) - Pull Request Testing

Runs on every push and pull request:
- Validates formula syntax with `brew test-bot`
- Tests installation on 4 platforms
- Builds bottles for pull requests
- Uploads bottle artifacts

#### [publish.yml](.github/workflows/publish.yml) - Release Automation

Triggers on version tags (e.g., `3.14.1`):
- Builds bottles for all platforms
- Creates a GitHub Release (draft)
- Uploads bottles to the release

### Release Process

To create a new release:

1. **Update the formula** in `Formula/plotjuggler.rb`:
   - Update `url` with new version
   - Update `sha256` checksum
   - Test locally

2. **Create and push a tag:**
   ```bash
   git tag 3.14.1
   git push origin 3.14.1
   ```

3. **Automated workflow** will:
   - Build bottles for all platforms
   - Create a draft release on GitHub
   - Upload bottles to the release

4. **Review and publish** the draft release on GitHub

## Troubleshooting

### Installation Issues

**Problem:** Formula fails to install
```bash
# Try updating Homebrew first
brew update

# Check for conflicts
brew doctor
```

**Problem:** Qt5 dependency conflicts
```bash
# Qt@5 is keg-only, ensure it's properly linked
brew link qt@5 --force
```

### Build Issues

**Problem:** Build fails on Apple Silicon
```bash
# Ensure Rosetta is not interfering
arch -arm64 brew install plotjuggler
```

### Reporting Bugs

- **Formula issues:** [Open an issue](https://github.com/mrpollo/homebrew-plotjuggler/issues) in this repository
- **PlotJuggler bugs:** Report to [upstream PlotJuggler](https://github.com/facontidavide/PlotJuggler/issues)

## License

This tap is released under the [Apache-2.0 License](LICENSE).

PlotJuggler itself is licensed under MPL-2.0.