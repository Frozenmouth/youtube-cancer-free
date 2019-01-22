MyApplication::Application.config.session_store :redis_store,
  servers: ["redis://localhost:6379/0/session"],
  expire_after: 1.day,
  key: "_#{Rails.application.class.parent_name.downcase}_session",
  threadsafe: false