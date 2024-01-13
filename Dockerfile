FROM elixir:1.15-alpine AS build

# set build-time environment variables
ENV MIX_ENV=prod

WORKDIR /app
COPY . .

# pre-compile
RUN apk add --no-cache git
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get


# compile
RUN mix compile
RUN mix release

FROM elixir:1.15-alpine

COPY --from=build /app/_build/prod/rel/ip /release/ip
ENTRYPOINT [ "/release/ip/bin/ip" ]

# expose port
EXPOSE 4000