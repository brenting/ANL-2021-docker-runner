# Automated Negotiation League (ANL)
This repository contains a Docker based testing environment for the [Automated Negotiation League (ANL)](http://web.tuat.ac.jp/~katfuji/ANAC2021/genius.html). Agents can be developed for the [GeniusWeb](https://tracinsy.ewi.tudelft.nl/pubtrac/GeniusWeb) environment using the [ANL example agent](https://github.com/brenting/ANL-2021-example-agent). Questions regarding this repository can be asked on our [Discord server](https://discord.gg/qvXK3DJTuz).

## Usage
1. Make sure you have [Docker installed](https://docs.docker.com/get-docker/).
2. Run "run.ps1" on Windows or "run.sh" on Linux.

## Files & Directories
| Name | Type | Description |
| ----------- | ----------- | --------- |
| parties | directory | Contains the parties/agents in jar-file format that can be used. |
| profiles | directory | Contains the profiles or problems that agents can negotiate over. |
| results | directory | The results of the negotiations are placed here. File names will be preceded by a number that indicates the position of the step in the "settings.yaml" file. Utilities of both agents are added to every action in the result file for analysis. If the final action is an accept, than the negotiation was successful and the final utility for both agents can be found in that action.|
| tmp | directory | The "negotiationdata" and "persistentstate" files (see [competition description](http://web.tuat.ac.jp/~katfuji/ANAC2021/genius.html)) will be copied to this directory after all the sessions in the "settings.yaml" file are finished. You can analyse them to see what was stored by the agents. The name of the files will correspond to the names that the user provided in the "settings.yaml" file. |
| settings.yaml | file | This file contains a list of steps that are executed by the GeniusWeb Docker image. An example is already provided. more information on its contents can be found below. |

## settings.yaml
This file is the backbone for testing your agent. It is a list of steps that are executed by the GeniusWeb Docker image. Any flaws in the "settings.yaml" file are likely to be filtered out through an Assertion Error by the Docker image.

There are two possible entries in the list of steps:
- Negotiation steps.
- Learning steps.

Every step requires the specification of a deadline in seconds and a list of parties involved. Per agent a few things must be specified:
- A relative path to the agent jar-file. You can build your own jar-file using the [ANL example agent](https://github.com/brenting/ANL-2021-example-agent).
- A profile of the same underlying negotiation domain. A profile specifies the preference or utility of an agent over a negotiation problem. e.g. Suppose we would want to negotiate over the japantrip domain (see "profiles" directory), then we would assign the "japantrip1.json" profile to one agent and the "japantrip2.json" profile to the other agent.
- A dictionary of parameters that are passed to the agent in every session. This can be anything (see also [here](https://tracinsy.ewi.tudelft.nl/pubtrac/GeniusWeb#PartyParameters)), but to simulate the learning behaviour that is [this years challenge](http://web.tuat.ac.jp/~katfuji/ANAC2021/genius.html), the parameters "persistentstate" and "negotiationdata" are most important. See the [competition website ](http://web.tuat.ac.jp/~katfuji/ANAC2021/genius.html) and the example "settings.yaml" file to understand how to use these parameters.

## Notes
- Results are overwritten when a new test run is executed.
- Files in the "tmp" directory are not reused when a new test run is executed.
- The code of the Docker container can be found [here](https://github.com/brenting/ANL-2021-docker-runner-core). You can modify and build the container yourself should you wish to do so. It can also be run without Docker, but you'll have to do more installation work.
