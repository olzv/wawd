# WAWD

Notice: the project is not yet fully implemented.

A template Rails project with Web And Worker Dockerized in single container.  
Especially useful to run on Heroku in scope of single dyno. Such approach will relieve you from running additional Worker node. 

Including:
1. Configured for default Heroku Postgres database;
2. Caching gems in case of running with compose
3. Entrypoint script with automatic migration run and DB creation
4. Configured supervisord
5. Adapted to run on Heroku in Docker deployment mode
6. Included docker-compose.yml for running with Compose in self-hosted environment
7. Installed and configured DelayedJob
7. TODO: consider implementing a CLI tool for starting from scratch and covering existing project
8. TODO: switch to Alpine distribution
9. TODO: handle a case when running first time. Install Rails automatically then
10. TODO: consider one click deployments to Heroku and DG
11. TODO: allow to manage crontab
12. TODO: allow to specify the url to the repository where to clone from the existing app
13. TODO: extract the customizations into a separate gem

Follow instructions gere to configure your Heroku app for Docker deployment:
https://devcenter.heroku.com/articles/build-docker-images-heroku-yml

Notice:
Remember to add:
`config.logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(STDOUT))`
to `config/application.rb` in order to allow Puma to write request logs into STDOUT

(TODO) Run in development:
...
