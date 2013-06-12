require 'rack'

use Rack::Static,
  :urls => ["/images", "/javascripts", "/stylesheets"],
  :root => "build"

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('build/ipad-landing.html', File::RDONLY)
  ]
}