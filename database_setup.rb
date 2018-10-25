require './lib/postgresql_manager'

if ENV['RACK_ENV'] == 'test'
  PostgresqlManager.setup('diary_test')
else
  PostgresqlManager.setup('diary')
end
