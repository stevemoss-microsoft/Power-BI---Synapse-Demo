create schema vw

--- smaller aggregation view
-- 365 rows
CREATE materialized view vw.tripagg WITH (DISTRIBUTION=round_robin) AS
SELECT sum(PassengerCount) PassengerCount,
		dateid,
      SUM(TripDistanceMiles) as SumTripDistance,
      AVG(TripDistanceMiles) as AvgTripDistance
	  , count_big(TripDistanceMiles) as cb
	    , count_big(PassengerCount) as cb2
FROM  dbo.trip
group by dateid

-- larger takes 14 secs at DWU 500
--11,063,858 rows

Create materialized view vw.tripaggbig WITH (DISTRIBUTION=round_robin) AS
SELECT dbo.trip.[DateID],pickupgeographyid,
      SUM(TripDistanceMiles) as SumTripDistance,
	  count_big(TripDistanceMiles) as cb
FROM  dbo.trip
GROUP BY  dbo.trip.[DateID],pickupgeographyid

