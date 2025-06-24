if Rails.env.production?
    SolidQueue.database_configuration = {
      "production" => {
        "url" => ENV["DATABASE_URL"],
        "adapter" => "postgresql"
      }
    }
end