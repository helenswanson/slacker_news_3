require 'sinatra'
require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: 'slacker_news')
    yield(connection)
  ensure
    connection.close
  end
end

#display submitted articles
#every article should have description, title, and url
#url should link to relevant page inside new tab

#display for index
get "/index" do
  query = "SELECT * FROM articles"

  @articles = db_connection do |conn|
    conn.exec(query)
  end
  @articles = @articles.to_a


  erb :index
end

#redirect host to index page
get "/" do
  redirect "/index"
end

#display for comments
get "/comments" do
  erb :comments
end

#display for submit
get "/submit" do
  erb :submit
end

#accepting sent data and creating a csv
post "/submit" do
  title = params["title"]
  url = params["url"]
  description = params["description"]

  db_connection do |conn|
    conn.exec_params("INSERT INTO articles
      (title, url, description, created_at, completed_at)
      VALUES ($1, $2, $3, NOW(), NOW())",
        [title, url, description]
      )
  end

  redirect "/index"
end
