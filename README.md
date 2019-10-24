# docker-wasm-rust

### Description

Docker container for developing wasm-rust web applications. It's main goal is to
simplify the setup process of rust and wasm-rust project environment on a per
project basis.

### Technologies

Technologies installed right out of the box

* rust
* cargo
* cargo-generate
* wasm-pack
* npm
* yarn
* nginx

Technologies / alternate tagged containers planned for the future

* MySQL

### Usage
1. Create a docker-compose.yml file (example below)
2. docker-compose up -d
3. docker exec -it [docker pid goes here] /bin/bash
5. wasm-create-project [project name here]
6. Open your newly created project in your favorite ide from the project volume
and get coding

### Docker Compose

```yml
version: '3.7'
services:
  rust:
    image: btassone/wasm-rust
    ports:
      - 8080:80
    volumes:
      - ./project:/var/www/html/project
volumes:
  rust:
```

### Next Steps

If you are new to WASM Rust and are looking for further steps to get started
please take a look at:

https://rustwasm.github.io/
