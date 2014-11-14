# vim: ft=ruby

guard :minitest,  spring: 'rake test' do
  # with Minitest::Unit
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$})      { 'test' }

  # Rails 4
   watch(%r{^app/(.+)\.rb$})                               { 'test'}
   watch(%r{^app/controllers/application_controller\.rb$}) { 'test' }
   watch(%r{^app/controllers/(.+)_controller\.rb$})        { 'test'}
   watch(%r{^app/views/(.*)})                   { 'test'}
   watch(%r{^lib/(.+)\.rb$})                               {'test'}
   watch(%r{^test/.+_test\.rb$})
   watch(%r{^test/test_helper\.rb$}) { 'test' }
   watch(%r{^config/routes.rb$}) { 'test' }
end

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|scss|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end


guard :bundler do
  watch('Gemfile')
end
