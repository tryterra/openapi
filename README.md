# OpenAPI Definitions for Terra API

This repository contains OpenAPI specifications and JSON schema definitions for the Terra API, built using TypeSpec.

## Project Structure

- **`data_models/`** - TypeSpec source files and build configuration
  - **`specs/`** - TypeSpec data model definitions
  - **`tsp-output/`** - Generated schemas and OpenAPI specs
- **`schemas/`** - Promoted JSON schemas (ready for use)
- **`v5.yaml`** - Main OpenAPI v5 specification
- **`v6.yaml`** - OpenAPI v6 specification
- **`v5-bundled.yaml`** - Bundled version of v5 spec

## Building

### Prerequisites

Install dependencies:
```sh
cd data_models
npm install
```

### TypeSpec Build

Generate JSON schemas from TypeSpec definitions:
```sh
cd data_models
tsp compile . --emit=@typespec/json-schema
./promote.sh
```

This process:
1. Compiles TypeSpec files to JSON schemas
2. Promotes generated schemas to the root `schemas/` directory

### Bundling

Bundle the OpenAPI specification:
```sh
redocly bundle v5.yaml -o v5-bundled.yaml
```

## Development

### Code Quality

Run linting and formatting:
```sh
cd data_models
npm run lint        # Check for linting issues
npm run lint:fix    # Auto-fix linting issues
npm run format      # Format code with Prettier
npm run test        # Run tests
```

### Schema Validation

The schemas are automatically validated during the build process. All generated schemas follow JSON Schema standards and are compatible with OpenAPI 3.1.0.

## GitHub Actions

This repository includes automated workflows for:
- **Schema Generation**: Automatically builds and validates schemas on pull requests
- **Release**: Creates bundled releases when changes are merged to master

## Usage

The generated schemas can be used for:
- API validation and documentation
- Code generation in various languages
- Integration testing
- Client SDK development

## Contributing

1. Make changes to TypeSpec files in `data_models/specs/`
2. Run the build process to generate updated schemas
3. Test your changes with `npm test`
4. Ensure code quality with `npm run lint` and `npm run format`