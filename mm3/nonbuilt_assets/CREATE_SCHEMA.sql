-- Medication table:

-- The Medication Table stores information about the various medications.
-- Each row represents one particular fill for one prescription.  So, when
--    prescription is refilled, a new row is generated here.
-- This table can also store directions for periodic tasks, i.e. "take blood
--     pressure every night at 9pm"
-- This table can also store PRN medications- it would be designed so that every
--     time a new bottle of medication is opened, that bottle could be put in here
--     for tracking of batches.
-- TODO: How to deal with partial fills?

CREATE TABLE medication (
    publicid           TEXT,   -- uuid primary key
    batch_no        INT,    -- One particular instance of one fill for this medication
    active          INT,    -- Is this medication active?
    long_name       TEXT,   -- The long (descriptive) name (incl. brand name and generic if exists)
                            --    ex. "ONDANSETRON HCL 8MG TABLET Substituted for ZOFRAN"
    short_name      TEXT,   -- The short name of the med
                            --    ex. "ONDANSETRON HCL 8MG TABLET"
    directions      TEXT,   -- The directions on how to take this medication or what to do at this time
                            --    This comes from the prescription, or in the case of a PRN medication,
                            ---   the directions on the bottle.
    ndc_id          TEXT,   -- The NDC number of the medication
    rx_no           TEXT,   -- Prescription Number as assigned by the pharmacy
    rx_create_date  TEXT,   -- The date that the prescription was written
    rx_expire_date  TEXT,   -- Prescription Expire Date (usually 6 monthjs after the rx create date)
    fill_date       TEXT,   -- The fill date of this particular fill of this medication
                            --    (comes from pharmacy label)
    fill_units      TEXT,   -- The units used for filling (for example, ea, mL)
                            --    (comes from pharmacy label)
    qty_filled      REAL,   -- For this fill, the amount filled (for example "450 mL")
                            --    (comes from pharmacy label)
    rf_filled       REAL,   -- Number refills this fill consumes
                            --    (comes from pharmacy label)
    remaining_avail REAL,   -- The remaining number of refills available on this prescription
                            --    (comes from pharmacy label)
    safe_delay      INT,    -- How many hours apart does this need to be taken?
                            --    (Comes from the directions on the bottle, or the pharmacy label)
    barcode         TEXT,   -- The barcode on the medicine bottle, if it exists
    nfc_id          TEXT,   -- The NFC token ID of the sticker on the medicine bottle (for future use)
    manufacturer    TEXT REFERENCES person(publicid),   -- The manufacturer of this medication
    mfr_batch       TEXT,   -- Manufacturer's Batch Number
    patient         TEXT REFERENCES person(publicid),   -- Which patient this is for
                            -- (In cases where multiple people in the household are using the app)
    prescriber      TEXT REFERENCES person(publicid),   -- Which person prescribed this medication
    last_admin      TEXT DEFAULT CURRENT_TIMESTAMP,  -- When this was last administered
    prn_elg_rule    TEXT    -- The SQL query containing the eligibility rules: when is a PRN medication
                            --    safe to take, based on label directions and last administration?
);

-- Medication schedule header table: stores the schedule headers of medications.
-- These two schedule tables reflect how medication ought to be taken, NOT
-- actual instances of medication administration.

CREATE TABLE med_schedule_hdr (
    publicid            TEXT,   -- The publicid of the medication
    med_publicid        TEXT REFERENCES medication(publicid),    -- Medication ID number
    active              INT,    -- Is this schedule active?
    sched_directions    TEXT,   -- Directions as to scheduling
    comments            TEXT    -- Comments (updated on close of schedule)
);

-- Medication schedule detail table: One row for each instance of a required time;
-- for example, a medication that needs to be taken twice a day for 7 days will have
-- 14 rows in this table, each row contains a timestamp as to when the med needs to be
-- taken.

CREATE TABLE med_schedule_dtl (
    hdr_publicid                TEXT REFERENCES med_schedule_hdr(publicid),    -- The schedule this corresponds to)
    due_timestamp               TEXT,   -- The timestamp that this is due on
    admin_timestamp             TEXT,   -- The timestamp this was administered on
    active                      INT     -- This schedule item is deactivated when the med is
                                        --    administered
);

-- Medication notes table.  Medication records are not required to have notes, but if they do have notes,
--    those notes are stored in this table.

create table med_note (
    med_publicid        TEXT REFERENCES medication(publicid), -- What medication it belongs to
    title               TEXT,            -- Title of this note
    body_content        TEXT             -- Content of the note
)

-- Person table:

-- The Person Table: Information on the patient, family, caregivers.  One
--    row for each person.

CREATE TABLE person (
    publicid        TEXT,   -- UUID primary key of the person record
    first_name      TEXT,   -- Self Explanatory
    last_name       TEXT,   -- Self Explanatory
    pers_role       TEXT,   -- One of: Patient, Nurse, Caregiver, Doctor, Family, Manufacturer, Other
    phone           TEXT,   -- Phone number of this person
    created_on      TEXT DEFAULT CURRENT_TIMESTAMP  -- Self Explanatory
);

-- The Company table: companies involved in care (hospitals, drug manufacturers, etc)

CREATE TABLE company (
    publicid        TEXT,   -- UUID primary key of company record
    company_name    TEXT,   -- Self Explanatory
    location_id     TEXT,   -- Location ID (i.e. store number, etc.)
    role            TEXT    -- One of: Manufacturer, Distributor, Pharmacy, Home Health Company
)

-- Cross-reference that describes which persons belong in which company

n_co_pers (
    publicid        TEXT,   -- UUID primary key
    effective_date  TEXT,   -- Effective Date
    companyid       TEXT REFERENCES company(publicid),
    personid        TEXT REFERENCES person(publicid)
)

-- Event table:
-- The Event Table: a new row is generated whenever anything occurs:
--    Medication administered, med refilled, information on person added, etc

CREATE TABLE event (
    med_id          TEXT REFERENCES medication(publicid),
    quantity        REAL,
	quantity_units	TEXT,
    person_target   TEXT REFERENCES person(publicid), -- The person this event occurred to
    person_actor    TEXT REFERENCES person(publicid), -- The person who did the event
    description     TEXT,
    timestamp       TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Config table:

CREATE TABLE config (
    schema_version  INT,
    active          INT,
    date_initialized   TEXT
);
