import { resolvePath } from "@typespec/compiler";
import {
  createTestLibrary,
  TypeSpecTestLibrary,
} from "@typespec/compiler/testing";
import { fileURLToPath } from "url";

export const TerraDataModelsTestLibrary: TypeSpecTestLibrary =
  createTestLibrary({
    name: "terra_data_models",
    packageRoot: resolvePath(fileURLToPath(import.meta.url), "../../../../"),
  });
