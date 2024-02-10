FROM crystallang/crystal:1.11.2-alpine as base

# App lives here
WORKDIR /kamal

# Install dependencies
RUN apk --update --no-cache add \
  curl

# Throw-away build stage to reduce size of final image
FROM base as build

# Install shards
COPY shard.yml shard.lock ./

RUN shards install --production

# Copy application code
COPY . .

# Build app
RUN crystal build \
    --release \
    --static \
    --verbose \
    --stats \
    --progress \
    --time \
    --no-debug \
    -o ./bin/app src/fugu.cr

# Final stage for app image
FROM base

COPY --from=build /kamal/bin/app .

EXPOSE 3000

CMD ["./app"]