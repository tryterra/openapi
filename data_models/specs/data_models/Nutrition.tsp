import "./Samples.tsp";
namespace Schemas;

// Nutrition Model
model Nutrition {
    drink_samples?: DrinkSample[];
    meals?: Meal[];
    metadata: NutritionMetadata;
    summary?: NutritionSummary;
}

model NutritionMetadata {
    end_time: string;
    start_time: string;
    timestamp_localization?: integer;
}

model NutritionSummary {
    macros?: NutritionSummaryMacros;
    micros?: NutritionSummaryMicros;
    water_ml?: integer;
    drink_ml?: integer;
}

model NutritionSummaryMacros {
    alcohol_g?: integer;
    calories?: integer;
    carbohydrates_g?: integer;
    cholesterol_mg?: integer;
    fat_g?: integer;
    fiber_g?: integer;
    net_carbohydrates_g?: integer;
    protein_g?: integer;
    saturated_fat_g?: integer;
    sodium_mg?: integer;
    sugar_g?: integer;
    trans_fat_g?: integer;
}

model NutritionSummaryMicros {
    // Vitamins and minerals
    biotin_mg?: integer;

    caffeine_mg?: integer;
    calcium_mg?: integer;
    chloride_mg?: integer;
    chromium_mg?: integer;
    copper_mg?: integer;
    folate_mg?: integer;
    folic_acid_mg?: integer;
    iodine_mg?: integer;
    iron_mg?: integer;
    magnesium_mg?: integer;
    manganese_mg?: integer;
    molybdenum_mg?: integer;
    niacin_mg?: integer;
    pantothenic_acid_mg?: integer;
    phosphorus_mg?: integer;
    potassium_mg?: integer;
    riboflavin_mg?: integer;
    selenium_mg?: integer;
    thiamin_mg?: integer;
    vitamin_A_mg?: integer;
    vitamin_B12_mg?: integer;
    vitamin_B6_mg?: integer;
    vitamin_C_mg?: integer;
    vitamin_D_mg?: integer;
    vitamin_D2_mg?: integer;
    vitamin_D3_mg?: integer;
    vitamin_E_mg?: integer;
    vitamin_K_mg?: integer;
    zinc_mg?: integer;

    // Amino acids
    cystine_g?: integer;

    histidine_g?: integer;
    isoleucine_g?: integer;
    leucine_g?: integer;
    lysine_g?: integer;
    methionine_g?: integer;
    phenylalanine_g?: integer;
    threonine_g?: integer;
    tryptophan_g?: integer;
    tyrosine_g?: integer;
    valine_g?: integer;

    // Fats and fatty acids
    monounsaturated_fat_g?: integer;

    polyunsaturated_fat_g?: integer;
    omega3_g?: integer;
    omega6_g?: integer;

    // Carbohydrates
    starch_g?: integer;
}
// End of Nutrition Model
