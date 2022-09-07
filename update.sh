#!/usr/bin/env nix-shell
#! nix-shell -i oil -p oil

... curl -Ss --fail https://gbfs.baywheels.com/gbfs/en/station_status.json -H"User-Agent: https://terinstock.com"
    | jq -S '.data.stations |= sort_by(.station_id)'
    > station_status.json
    ;

... curl -Ss --fail https://gbfs.baywheels.com/gbfs/en/station_information.json -H"User-Agent: https://terinstock.com"
    | jq -S '.data.stations |= sort_by(.external_id)'
    > station_information.json
    ;

... curl -Ss --fail https://gbfs.baywheels.com/gbfs/en/system_alerts.json -H"User-Agent: https://terinstock.com"
    | jq -S '.data.alerts |= sort_by(.alert_id)'
    > system_alerts.json
    ;

... curl -Ss --fail https://gbfs.baywheels.com/gbfs/en/system_information.json -H"User-Agent: https://terinstock.com"
    | jq -S
    > system_information.json
    ;

git config user.name "GitHub Actions"
git config user.email "actions@users.noreply.github.com"
git commit -am "Latest data: $(date --iso-8601=seconds --utc)"
git push
