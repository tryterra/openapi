import { createTypeSpecLibrary } from "@typespec/compiler";

export const $lib = createTypeSpecLibrary({
  name: "terra_data_models",
  diagnostics: {},
});

export const { reportDiagnostic, createDiagnostic } = $lib;
