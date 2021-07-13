docker run `
-v ${PWD}/settings.yaml:/app/settings.yaml `
--mount type=bind,source=${PWD}/profiles,target=/app/profiles `
--mount type=bind,source=${PWD}/parties,target=/app/parties `
--mount type=bind,source=${PWD}/results,target=/app/results `
--mount type=bind,source=${PWD}/tmp,target=/app/tmp `
--name ANL_2021 `
brenting/anl_2021:1.1.0

docker rm ANL_2021

pause