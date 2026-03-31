# ARR Searcher

A simple container that periodically triggers searches for missing content on the arr stack.

A containerized version of the script found at [https://gist.github.com/rabidpug/a023ce2b62c4df806671ad19c105f835] that can be deployed alongside your existing docker applications.

## Basic use

Copy `docker-compose.yaml`, deleting the line for `build`, and create a `.env` file based on `.env.example`.

Start the container in daemon mode using `docker compose up -d`.

Monitor logs using `docker compose logs -f`.

Stop the container using `docker compose down`.

Triggers a search every 1 hour, which can be configured through the `SLEEP_TIMER` environment variable.
