import "./Samples.tsp";
namespace Schemas;

// Menstruation Model
model Menstruation {
    metadata: MenstruationMetadata;
    menstruation_data?: MenstruationData;
}

model MenstruationMetadata {
    end_time: string;
    start_time: string;
}

model MenstruationData {
    period_length_days?: float;
    current_phase?: MenstrualPhase;
    length_of_current_phase_days?: float;
    days_until_next_phase?: float;
    period_start_date?: string;
    predicted_cycle_length_days?: float;
    day_in_cycle?: float;
    last_updated_time?: string;
    cycle_length_days?: float;
    is_predicted_cycle?: string;
    menstruation_flow?: MenstruationFlowSample[];
}
// End of Menstruation Model
