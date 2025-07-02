# OpenAPI Definitions for Terra API

## Building
### Typespec Build
```
cd data_models
tsp compile . --emit=@typespec/json-schema
./promote.sh
```

### Bundling
```sh
redocly bundle v5.yaml -o v5-bundled.yaml
```