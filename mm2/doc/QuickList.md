
# QuickList #

The QuickList is a feature that allows the user to tell at a glance if a particular medication is able to be taken.  It is driven by an SQL query that draws from the event log and medications table.

## Narrative ##

As an example let's consider Tylenol Extra Strength Caplets (which we will refer to as TESC):
https://www.tylenol.com/products/tylenol-extra-strength-caplets

In order for the patient to be able to take TESC, the following must be true:
1. Patient must not have had 2 caplets in the past 6 hours
2. Patient must not have had 6 caplets in the past 24 hours
3. Patient must have not been taking TESC for greater than 10 days.

The input of this query will be a medication ID (as stored in the medications table in the main database) and the output will be a list timestamps and dose amounts that describes when the next dose is permitted.  In the case of TESC, we might have one row that tells when 1/2 dose is allowed and a second row that tells when a full dose is allowed.

In the UI, the medication shall be listed with a green background if it is OK to take a full dose, a yellow background if it is OK to take a partial dose, and a red background if no dose can be taken.  I.E. if the query returns no rows that describe timestamps in the past, then that particular row shall have red background, and it shall indicate when the next partial and when the next full doses are permitted.  If the query returns at least one timestamp in the past but also at least one in the future, then the row shall have yellow background and it shall indicate when the next full dose is permitted.  If the query returns all rows in the past, then the row shall have a green background.

At this time we will support up to 1/4 increments of a full dose.  A "full dose" is defined as the maximum amount that is permitted at one time, for example for TESC you are permitted to have up to two 500mg caplets at the same time.

## Example ##

### Inputs: ###

1. Medication ID: the *event* table will contain the events for this particular medication.

### Query Sections ###

#### Rule 1: Caplets per 6 Hours ####

The patient must not have had 2 caplets in the past 6 hours.

```
-- THIS QUERY IN DRAFT STATUS
select
  timestamp,
  quantity,
  quantity_units
from event ev1
where
  ev1.med_id = (Insert med_id here) and
  (ev1.timestamp < TIME());
```
