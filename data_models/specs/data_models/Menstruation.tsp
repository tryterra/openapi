import "./Samples.tsp";
import "./enums.tsp";
namespace Terra.Models;

// Menstruation Model
model Menstruation {
    @doc("Object containing daily summary metadata.")
    metadata: MenstruationMetadata;

    @doc("Object containing information on user's menstruation for a given day.")
    menstruation_data?: MenstruationData;
}

model MenstruationMetadata {
    @doc("The end time of the associated day, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h after start_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("2022-10-28T10:00:00.000000+01:00")
    end_time: string;

    @doc("The start time of the associated day, in ISO8601 format with microsecond precision. Will always fall on midnight of any given day, and will always be equal to 24h before end_time. TimeZone info will be provided whenever possible. If absent, the time corresponds to the user's local time.")
    @example("1999-11-23T09:00:00.000000+02:00")
    start_time: string;

    timestamp_localization?: Terra.Enums.TimestampLocalization;
}

model MenstruationData {
    @doc("Total length of period (i.e. menstrual bleeding).")
    @example(5)
    period_length_days?: integer;

    @doc("Phase in associated cycle, (i.e. menstruation, fertile etc).")
    @example(1)
    current_phase?: Terra.Enums.MenstrualPhase;

    @doc("Length of current phase.")
    @example(5)
    length_of_current_phase_days?: integer;

    @doc("Number of days to reach the next phase (predicted).")
    @example(23)
    days_until_next_phase?: integer;

    @doc("Start date of menstrual cycle, in ISO8601 format.")
    @example("2022-11-28")
    period_start_date?: string;

    @doc("Prediction of the cycle's total length.")
    @example(28)
    predicted_cycle_length_days?: integer;

    @doc("Number of day in cycle this object is associated with.")
    @example(24)
    day_in_cycle?: integer;

    @doc("Last time when the user recorded information regarding their cycle, in ISO8601 format, with microseconds precision.")
    @example("2022-12-12T14:03:05.000000-05:00")
    last_updated_time?: string;

    @doc("Total cycle length.")
    @example("28")
    cycle_length_days?: string;

    @doc("Flag indicating whether associated object is a prediction or user-logged information.")
    @example("true")
    is_predicted_cycle?: string;

    @doc("List of user logs of information related to the strength of user's menstrual flow.")
    menstruation_flow?: MenstruationFlowSample[];
}
// End of Menstruation Model
