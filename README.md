# WAWD

Notice: the project is not yet fully implemented.

A template Rails project with Web And Worker Dockerized in single container.  
Especially useful to run on Heroku in scope of single dyno. Such approach will relieve you from running additional Worker node. 

Including:
1. Configured for default Heroku Postgres database;
2. Caching gems in case of running with compose
3. Entrypoint script with automatic migration run and DB creation
4. Configured supervisord
4. Adapted to run on Heroku
5. Included docker-compose.yml for running with docker in self hosted environment
6. Installed DelayedJob
6. TODO: Switch to Alpine distribution
7. TODO: handle a case when running first time. Install Rails automatically then
6. TODO: consider one click deployments to Heroku and DG
7. TODO: allow to manage crontab
9. TODO: allow to specify the url to the repository where to clone from the existing app
10. TODO: extract the customizations into a separate gem

Follow instructions gere to configure your Heroku app for Docker deployment:
https://devcenter.heroku.com/articles/build-docker-images-heroku-yml

Notice:
Remember to add:
`config.logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(STDOUT))`
to `config/application.rb` in order to allow Puma to write request logs into STDOUT

(TODO) Run in development:
...
