FROM mhart/alpine-node
WORKDIR /app
COPY app/ .
WORKDIR /app/redux-devtools
RUN npm install
WORKDIR /app/redux-devtools/examples/todomvc
Run npm install