SELECT
parcels.*,
mercats.cartodb_id as mercats_id,
ST_Distance(geography(mercats.the_geom), geography(parcels.the_geom)) AS distance
FROM
barcelona_building_footprints AS parcels
CROSS JOIN LATERAL
(SELECT cartodb_id, the_geom
FROM mercats_municipals
ORDER BY
parcels.the_geom_webmercator <-> the_geom_webmercator
LIMIT 1) AS mercats
