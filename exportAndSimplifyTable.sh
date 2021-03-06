echo "Exporting from DB to GeoJSON"
ogr2ogr -f GeoJSON parcels.geojson  "PG:host=${1:-localhost} dbname=${2:-gis} user=${3:-docker}" \
-sql "select * FROM public.filtered_parcels_for_export" -t_srs "EPSG:4326"; 

echo "Running Tippecanoe"
tippecanoe -o parcels.mbtiles parcels.geojson  -f -z 15 -Z 8 -l default -Bg --coalesce-smallest-as-needed --maximum-tile-bytes=1000000;
#tippecanoe -o parcels.mbtiles parcels.geojson --no-tiny-polygon-reduction --no-feature-limit --no-tile-size-limit -f -z 15 -Z 5 -l default;
#tippecanoe -o parcels.mbtiles --drop-densest-as-needed parcels.geojson -f -z 15 -Z 5 -l default;
#--coalesce-smallest-as-needed
rm parcels.geojson

echo "Moving exported file to tile server folder"
mv -f parcels.mbtiles ../mbtiles-server/parcels.mbtiles

echo "Done!"