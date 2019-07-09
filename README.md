# WAWD

Notice: the project is not yet fully implemented.

A template Rails project with Web And Worker Dockerized in single container.  
Especially useful to run on Heroku in scope of single dyno. Such approach will relieve you from running additional Worker node.
Meaning you can even run the application on free dyno and keep processing background jobs.

Including:
1. Adapted to run on Heroku in [Docker Deployment Mode](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml)
2. Included docker-compose.yml for running with Docker Compose in self-hosted environment
3. Configured for default Heroku Postgres database;
4. Configured to cache gems in case of running with Docker Compose;
5. Entrypoint script with automatic migrations run and DB creation when needed;
6. Configured supervisord to run multiple processes in single container;
7. Installed and configured [DelayedJob](https://github.com/collectiveidea/delayed_job)
8. Installed a UI for DelayedJob [delayed_job_web](https://github.com/ejschmitt/delayed_job_web)


Follow instructions gere to configure your Heroku app for Docker deployment:
https://devcenter.heroku.com/articles/build-docker-images-heroku-yml

Notice:
Remember to add:
`config.logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(STDOUT))`
to `config/application.rb` in order to allow Puma to write request logs into STDOUT

(TODO) Run in development:
...
