require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Reload code on every request. Good for development.
  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true

  # Caching toggle
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # File uploads
  config.active_storage.service = :local




  # Logging & debugging
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_job.verbose_enqueue_logs = true

  config.assets.quiet = true
  config.action_view.annotate_rendered_view_with_filenames = true

  # Live reload for development
  config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload

end
