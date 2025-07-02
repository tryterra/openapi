import "@typespec/json-schema";
import "./specs/data_models/enums.tsp";
import "./specs/data_models/common.tsp";
import "./specs/data_models/Samples.tsp";
import "./specs/data_models/TerraUser.tsp";
import "./specs/data_models/Activity.tsp";
import "./specs/data_models/Daily.tsp";
import "./specs/data_models/Sleep.tsp";
import "./specs/data_models/Nutrition.tsp";
import "./specs/data_models/Menstruation.tsp";
import "./specs/data_models/Athlete.tsp";
import "./specs/data_models/Body.tsp";
import "./specs/data_models/Events.tsp";

using JsonSchema;

@jsonSchema("https://raw.githubusercontent.com/tryterra/openapi/refs/heads/v5-update/schemas/")
namespace Terra;
