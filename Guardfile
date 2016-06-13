require 'active_support/inflector'

guard :minitest, all_on_start: false, env: { 'NO_COVERAGE' => 'true' } do
  # with Minitest::Unit
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$})      { 'test' }

  #         # Rails 4
  watch(%r{^app/(.+)\.rb$})                               { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^app/controllers/application_controller\.rb$}) { 'test/controllers' }
  watch(%r{^app/controllers/(.+)_controller\.rb$})        { |m| "test/integration/#{m[1]}_test.rb" }
  watch(%r{^app/views/(.+)_mailer/.+})                   { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
  watch(%r{^lib/(.+)\.rb$})                               { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/test_helper\.rb$}) { 'test' }
  #                         # extra tests
  watch(%r{^app/views/(.+)/.+}) { |m| "test/controllers/#{m[1]}_controller_test.rb" }
  watch(%r{^test/fixtures/(.+)\.yml}) { |m| "test/models/#{m[1].singularize}_test.rb" }
  watch(%r{^test/fixtures/(.+)\.yml}) { |m| "test/controllers/#{m[1]}_controller_test.rb" }
end
