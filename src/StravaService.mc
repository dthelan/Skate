using Toybox.Communications;
using Toybox.System;

class StravaService {

    const API_URL = "https://www.strava.com/api/v3";
    var _accessToken = "YOUR_ACCESS_TOKEN"; // Replace with your actual access token

    function uploadActivity(activityData) {
        var url = API_URL + "/uploads";
        var headers = {
            "Authorization" => "Bearer " + _accessToken
        };
        var params = {
            "activity_type" => "ride", // or "run", "swim", etc.
            "name" => "Garmin Activity",
            "description" => "Recorded with Garmin device",
            "data_type" => "json",
            "file" => Json.encode(activityData)
        };

        Communications.post(url, headers, params, method(:onUploadComplete));
    }

    function onUploadComplete(responseCode, data) {
        if (responseCode == 201) {
            System.println("Activity uploaded successfully!");
        } else {
            System.println("Failed to upload activity: " + responseCode);
        }
    }
}