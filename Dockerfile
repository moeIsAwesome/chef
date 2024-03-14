# Build stage
FROM node:21-alpine3.17 AS build

WORKDIR /app
RUN apk update && apk upgrade && \
    apk add --no-cache git
COPY . .
RUN npm install -g pnpm && \
    pnpm install --frozen-lockfile && \
    pnpm run build


# Production stage
FROM node:21-alpine3.17
WORKDIR /app
COPY --from=build /app/package.json /app/package.json
COPY --from=build /app/pnpm-lock.yaml /app/pnpm-lock.yaml
COPY --from=build /app/build /app/build
RUN npm install pnpm pm2 -g && \
    pnpm install --frozen-lockfile --prod


EXPOSE 3000
CMD ["pm2-runtime", "--watch", "build/index.js"]