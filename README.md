<h1 align="center">
  TRZ (The Resident Zombie) - Backend
</h1>

## :mag_right: Database diagram

<p align="center">
  <img alt="diagram" src="https://user-images.githubusercontent.com/40550247/113447445-4381e900-93d0-11eb-8b66-d5f737ce66a2.png" />
</p>

## :rocket: Technologies

* [Ruby](https://www.ruby-lang.org/en/)
* [Rails](https://rubyonrails.org/)
## :electric_plug: Prerequisites

- [Ruby version (= 2.7.2)](https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.2.tar.gz)
- [Rails version (= 6.0.3.5)](https://rubygems.org/gems/rails/versions/6.0.3.5)

## :information_source: Getting Started

1. Fork this repository and clone it on your machine.
2. Change the directory to `challenge-trz` where you cloned it.

## :closed_lock_with_key: Backend Getting Started 

1. Install dependencies
```shell
$ bundle install
```
2. Setup database
```shell
$ rails db:prepare
$ rails db:seed 
```
3. Start the application
```shell
$ rails s
```
 * Open backend, the host [localhost:3000](http://localhost:3000)

## :toolbox: Running the tests

```shell
$ rspec
```
## :spiral_notepad: Endpoints documentation - Swagger

With the server running, access [http://localhost:3000/api-docs](http://localhost:3000/api-docs)

---