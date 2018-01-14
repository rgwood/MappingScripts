echo "Exporting from DB to GeoJSON"
ogr2ogr -f GeoJSON parcels.geojson  "PG:host=${1:-localhost} dbname=${2:-gis} user=${3:-docker}" \
-sql "select id, address, area_sq_metres, geom FROM public.van_parcels_for_export" -t_srs "EPSG:4326"; 

echo "Running Tippecanoe"
tippecanoe -o parcels.mbtiles parcels.geojson --coalesce-smallest-as-needed -f -z 15 -Z 5 -l default;
#tippecanoe -o parcels.mbtiles --drop-densest-as-needed parcels.geojson -f -z 15 -Z 5 -l default;

mv -f parcels.mbtiles ../mbtiles-server/parcels.mbtiles