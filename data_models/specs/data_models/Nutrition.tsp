import "./Samples.tsp";
import "./enums.tsp";
namespace Terra.Models;

// Nutrition Model
model Nutrition {
    @doc("Information on drinks the user consumed throughout the day.")
    drink_samples?: DrinkSample[];

    @doc("Information on individual foods consumed throughout a given day.")
    meals?: Meal[];

    @doc("Object containing daily summary metadata.")
    metadata: NutritionMetadata;

    @doc("Summative nutritional information for a given day.")
    summary?: NutritionSummary;
}

model NutritionMetadata {
    @doc("The end time of the associated day, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h after start_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-10-28T10:00:00.000000+01:00")
    end_time: string;

    @doc("The start time of the associated day, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h before end_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T09:00:00.000000+02:00")
    start_time: string;

    timestamp_localization?: Terra.Enums.TimestampLocalization;
}

model NutritionSummary {
    @doc("Summary of macronutrient information for a given day.")
    macros?: NutritionMacros;

    @doc("Summary of micronutrient information for a given day.")
    micros?: NutritionMicros;

    @doc("Water consumption of the user for a given day.")
    @example(2000.0)
    water_ml?: float;

    @doc("Non-water drink consumption of the user for a given day.")
    @example(500.0)
    drink_ml?: float;
}

// End of Nutrition Model
