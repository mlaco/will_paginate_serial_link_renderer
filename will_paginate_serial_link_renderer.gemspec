# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'will_paginate_serial_link_renderer/version'

Gem::Specification.new do |spec|
  spec.name          = "will_paginate_serial_link_renderer"
  spec.version       = WillPaginateSerialLinkRenderer::VERSION
  spec.authors       = ["Morgan Laco"]
  spec.email         = ["morgan@codeschool.com"]
  spec.summary       = "Link renderer for use with [will_paginate](https://github.com/mislav/will_paginate) that produces output suitable for serialized transmission."
  spec.description   = %q{
    Link renderer for use with [will_paginate](https://github.com/mislav/will_paginate).
    When paginated results are loaded asyncronously, it is not ideal to output fully fleshed-out html for the links; there is too much redundancy in doing so.
    Additionally, if you're requesting pagination asyncronously, you don't want links anyway, because you'd want to allow users to view results on other pages
    without a page reload.
    This gem reduces each link to its minimal form: a page number.
  }
  spec.homepage      = "https://github.com/mlaco/will_paginate_serial_link_renderer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "will_paginate", "~> 3.1"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
