$query = "
select * from 
(
	select stop_lat, stop_lon, ROW_NUMBER() OVER (ORDER BY stop_id) as row from STM_SRC.dbo.stops
) a
where a.row between 9206 and 9600
"
$stops = Invoke-Sqlcmd -Query $query

foreach ($stop in $stops) {
    $lat = $stop.stop_lat
    $lon = $stop.stop_lon
    
    $geoRequest = Invoke-WebRequest "https://maps.googleapis.com/maps/api/geocode/xml?latlng=$lat,$lon"
    $geoResponse = [xml]$geoRequest.Content


    $districtObject = $geoResponse.GeocodeResponse.result | where {$_.type -eq 'sublocality_level_1'} | select -First 1 formatted_address
    $district = $districtObject.formatted_address

    $postalCodeObject = $geoResponse.GeocodeResponse.result | where {$_.type -eq 'postal_code'} | select -First 1 formatted_address
    $postalCode = $postalCodeObject.formatted_address

    
    $stop | Add-Member -MemberType NoteProperty -Name district -Value $district
    $stop | Add-Member -MemberType NoteProperty -Name postal_code -Value $postalCode

    Write-Host "https://maps.googleapis.com/maps/api/geocode/xml?latlng=$lat,$lon"

    #google maps doesn't accept more than 10 requests per second -- adding a waiting period of 1 seconds between requests

    Start-Sleep -s 1

}



$stops | Export-Csv G:\file17.csv
