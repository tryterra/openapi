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
    macros?: NutritionSummaryMacros;

    @doc("Summary of micronutrient information for a given day.")
    micros?: NutritionSummaryMicros;

    @doc("Water consumption of the user for a given day.")
    @example(2000.0)
    water_ml?: float;

    @doc("Non-water drink consumption of the user for a given day.")
    @example(500.0)
    drink_ml?: float;
}

model NutritionSummaryMacros {
    @doc("Alcohol content of the associated food(s).")
    @example(14.0)
    alcohol_g?: float;

    @doc("Calorie content of the associated food(s).")
    @example(2000.0)
    calories?: float;

    @doc("Carbohydrates content of the associated food(s).")
    @example(300.0)
    carbohydrates_g?: float;

    @doc("Cholesterol content of the associated food(s).")
    @example(300.0)
    cholesterol_mg?: float;

    @doc("Fat content of the associated food(s).")
    @example(65.0)
    fat_g?: float;

    @doc("Fiber content of the associated food(s).")
    @example(25.0)
    fiber_g?: float;

    @doc("Net carbs content of the associated food(s).")
    @example(275.0)
    net_carbohydrates_g?: float;

    @doc("Protein content of the associated food(s).")
    @example(50.0)
    protein_g?: float;

    @doc("Saturated fat content of the associated food(s).")
    @example(20.0)
    saturated_fat_g?: float;

    @doc("Sodium content of the associated food(s).")
    @example(2300.0)
    sodium_mg?: float;

    @doc("Sugar content of the associated food(s).")
    @example(25.0)
    sugar_g?: float;

    @doc("Trans fat content of the associated food(s).")
    @example(2.0)
    trans_fat_g?: float;
}

model NutritionSummaryMicros {
    @doc("Biotin content of the associated food(s).")
    @example(0.03)
    biotin_mg?: float;

    @doc("Caffeine content of the associated food(s).")
    @example(95.0)
    caffeine_mg?: float;

    @doc("Calcium content of the associated food(s).")
    @example(1000.0)
    calcium_mg?: float;

    @doc("Chloride content of the associated food(s).")
    @example(2300.0)
    chloride_mg?: float;

    @doc("Chromium content of the associated food(s).")
    @example(0.035)
    chromium_mg?: float;

    @doc("Copper content of the associated food(s).")
    @example(0.9)
    copper_mg?: float;

    @doc("Folate content of the associated food(s).")
    @example(0.4)
    folate_mg?: float;

    @doc("Folic Acid content of the associated food(s).")
    @example(0.4)
    folic_acid_mg?: float;

    @doc("Iodine content of the associated food(s).")
    @example(0.15)
    iodine_mg?: float;

    @doc("Iron content of the associated food(s).")
    @example(8.5)
    iron_mg?: float;

    @doc("Magnesium content of the associated food(s).")
    @example(320.0)
    magnesium_mg?: float;

    @doc("Manganese content of the associated food(s).")
    @example(2.3)
    manganese_mg?: float;

    @doc("Molybdenum content of the associated food(s).")
    @example(0.045)
    molybdenum_mg?: float;

    @doc("Niacin content of the associated food(s).")
    @example(16.0)
    niacin_mg?: float;

    @doc("Pantothenic content of the associated food(s).")
    @example(5)
    pantothenic_acid_mg?: float;

    @doc("Phosphorus content of the associated food(s).")
    @example(1000.0)
    phosphorus_mg?: float;

    @doc("Potassium content of the associated food(s).")
    @example(3500.0)
    potassium_mg?: float;

    @doc("Riboflavin content of the associated food(s).")
    @example(1.3)
    riboflavin_mg?: float;

    @doc("Selenium content of the associated food(s).")
    @example(0.055)
    selenium_mg?: float;

    @doc("Thiamin content of the associated food(s).")
    @example(1.2)
    thiamin_mg?: float;

    @doc("Vitamin A content of the associated food(s).")
    @example(0.9)
    vitamin_A_mg?: float;

    @doc("Vitamin B12 content of the associated food(s).")
    @example(0.0024)
    vitamin_B12_mg?: float;

    @doc("Vitamin B6 content of the associated food(s).")
    @example(1.7)
    vitamin_B6_mg?: float;

    @doc("Vitamin C content of the associated food(s).")
    @example(90)
    vitamin_C_mg?: float;

    @doc("Vitamin D content of the associated food(s).")
    @example(0.02)
    vitamin_D_mg?: float;

    @doc("Vitamin D2 content of the associated food(s).")
    @example(0.01)
    vitamin_D2_mg?: float;

    @doc("Vitamin D3 content of the associated food(s).")
    @example(0.015)
    vitamin_D3_mg?: float;

    @doc("Vitamin E content of the associated food(s).")
    @example(15.0)
    vitamin_E_mg?: float;

    @doc("Vitamin K content of the associated food(s).")
    @example(0.12)
    vitamin_K_mg?: float;

    @doc("Zinc content of the associated food(s).")
    @example(11.0)
    zinc_mg?: float;

    // Amino acids
    @doc("Cystine content of the associated food(s).")
    @example(0.3)
    cystine_g?: float;

    @doc("Histidine content of the associated food(s).")
    @example(0.6)
    histidine_g?: float;

    @doc("Isoleucine content of the associated food(s).")
    @example(0.8)
    isoleucine_g?: float;

    @doc("Leucine content of the associated food(s).")
    @example(1.2)
    leucine_g?: float;

    @doc("Lysine content of the associated food(s).")
    @example(0.9)
    lysine_g?: float;

    @doc("Methionine content of the associated food(s).")
    @example(0.6)
    methionine_g?: float;

    @doc("Phenylalanine content of the associated food(s).")
    @example(0.9)
    phenylalanine_g?: float;

    @doc("Threonine content of the associated food(s).")
    @example(0.5)
    threonine_g?: float;

    @doc("Tryptophan content of the associated food(s).")
    @example(0.3)
    tryptophan_g?: float;

    @doc("Tyrosine content of the associated food(s).")
    @example(0.7)
    tyrosine_g?: float;

    @doc("Valine content of the associated food(s).")
    @example(0.8)
    valine_g?: float;

    // Fats and fatty acids
    @doc("Monounsaturated fat content of the associated food(s).")
    @example(15.0)
    monounsaturated_fat_g?: float;

    @doc("Polyunsaturated fat content of the associated food(s).")
    @example(13.0)
    polyunsaturated_fat_g?: float;

    @doc("Omega3 content of the associated food(s).")
    @example(1.6)
    omega3_g?: float;

    @doc("Omega6 content of the associated food(s).")
    @example(17.0)
    omega6_g?: float;

    // Carbohydrates
    @doc("Starch content of the associated food(s).")
    @example(25.0)
    starch_g?: float;
}
// End of Nutrition Model
