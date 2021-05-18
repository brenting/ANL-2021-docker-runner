sudo docker run \
-v "$(pwd)"/settings.yaml:/app/settings.yaml \
--mount type=bind,source="$(pwd)"/profiles,target=/app/profiles \
--mount type=bind,source="$(pwd)"/parties,target=/app/parties \
--mount type=bind,source="$(pwd)"/results,target=/app/results \
--mount type=bind,source="$(pwd)"/tmp,target=/app/tmp \
brenting/anl_2021:1.1.0