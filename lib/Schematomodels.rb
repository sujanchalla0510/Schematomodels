require "Schematomodels/version"


module Schematomodels
  class Generater
    attr_reader :connect, :db_results

    def initilize(adapter, host, database, username, password)
      @adapter = adapter
      @host = host
      @database = database
      @username = username
      @password = password
    end

    def generate_models
      get_connection
      get_schema_tables
      create_models
    end

    private
      def get_connection
        @connect = ActiveRecord::Base.establish_connection(
          :adapter  => adapter,
          :host     => host,
          :username => username,
          :password => password,
          :database => database
        )
      end

      def get_schema_tables
        query = "select table_schema,table_name from information_schema.tables where table_type = 'BASE TABLE'"
        @db_results = connect.connection.execute(query)
      end

      def create_models
        db_results.each do |result|
          schema = result.table_schema
          table = result.table_name.singularize
          exec "rails g model #{schema}/#{table} --no-test-framework --migration=false"
          exec "rm /app/models/#{schema}.rb"
        end
      end
  end
end

