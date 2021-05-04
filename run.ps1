docker run `
-v ${PWD}/settings/settings1.json:/settings.json `
--mount type=bind,source=${PWD}/profiles,target=/app/profiles `
--mount type=bind,source=${PWD}/parties,target=/app/parties `
--mount type=bind,source=${PWD}/results,target=/app/results `
--mount type=bind,source=${PWD}/tmp,target=/app/tmp `
brenting/anl_2021:1.0.0