# OpenAPI Definitions for Terra API

## Building
### Typespec Build
```sh
cd data_models
tsp compile . --emit=@typespec/json-schema
./promote.sh
```

### Bundling
```sh
redocly bundle v5.yaml -o v5-bundled.yaml
```