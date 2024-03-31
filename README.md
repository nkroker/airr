# Airr
Simple app to visualize AQI using rails 7

## Manual Install
  #### Steps to install
  - Clone the Repo cd into the repo
  - Rename `dot-env.example` to '.env`
  - Make sure you have ruby `3.1.4` installed
  - Run `bin/setup`
  - Run 'rails server' & 'bundle exec sidekiq`
  - Open [localhost](http://0.0.0.0:3000)

## Docker install
  #### Prerequisite
  - Make
  - Docker
  - Docker Compose
  - Rename `dot-env.example` to '.env`

#### Instalation
I've added make to simplify the process command description is
  ```bash
    - make
      - install           [For installation]
      - run               [For install + run]
      - stop              [For stopping everything]
      - shell             [For launching a bash shell in web container]
      - console           [For launching a rails console in web service]
      - db-setup          [For running rake db:setup]
      - attach            [For attaching the logs to current shell]
      - clean             [For clean uninstall of project]
      - list              [For checking the running services]
      - setup             [For explicitly running bin/setup in web service]
  ```

After running launch
  [localhost](http://0.0.0.0:3000)

## License

This work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/).
