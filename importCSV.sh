


./csv2table --file ~/Downloads/property_tax_report.csv --lower --mogrify --copy --backslash 
#can use -1 to wrap in a transaction

#to connect to Postgres and run the /copy:
psql --host=localhost gis docker

To fix up a column type:
alter table myTable
  alter column myColumn type numeric
    using (trim(myColumn)::numeric)