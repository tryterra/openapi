namespace Terra.Models;

// Hormone Model
//
// One entry per test event. Each entry collapses all hormones measured at a
// single `timestamp` into a single object, with one field per hormone.
// Hormones not measured at that test event appear as null in the actual
// payload. Unlike v2 data types, hormone has no `metadata` wrapper; the
// top-level `timestamp` field serves as the unique identifier per entry.
model HormoneSample {
    @doc("ISO-8601 timestamp of the test event, including timezone offset.")
    @example("2026-05-07T08:00:00+02:00")
    timestamp: string;

    @doc("Luteinizing hormone reading, milli-international units per millilitre.")
    @example(5.2)
    lh_mIU_per_ml?: float;

    @doc("Estrone-3-glucuronide reading, nanograms per millilitre. Urinary estrogen metabolite, rises before ovulation.")
    @example(108.5)
    e3g_ng_per_ml?: float;

    @doc("Pregnanediol glucuronide reading, micrograms per millilitre. Urinary progesterone metabolite, confirms ovulation.")
    @example(2.4)
    pdg_ug_per_ml?: float;

    @doc("Human chorionic gonadotropin reading, milli-international units per millilitre. Pregnancy hormone.")
    @example(0.8)
    hcg_mIU_per_ml?: float;

    @doc("Follicle-stimulating hormone reading, milli-international units per millilitre. Ovarian reserve / menopause indicator.")
    @example(4.8)
    fsh_mIU_per_ml?: float;
}
// End of Hormone Model
