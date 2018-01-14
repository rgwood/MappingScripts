ogr2ogr -f GeoJSON parcels.geojson  "PG:host=localhost dbname=gis user=${1:-docker} password=${2:-docker}" \
-sql "select id, civic_no || ' ' || streetname address, geom FROM van_parcels" -t_srs "EPSG:4326"; 

tippecanoe -o parcels.mbtiles --drop-densest-as-needed parcels.geojson -f -z 15 -Z 5 -l default;
