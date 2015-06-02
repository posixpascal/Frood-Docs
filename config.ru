$stdout.sync = true

use Rack::Static,
  :urls => ["/css/*", "/fonts/*", "js/*", "partials/*", "partials/api/*", "partials/api", "css", "js", "font"],
  :root => "."

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('index.html', File::RDONLY)
  ]
}

