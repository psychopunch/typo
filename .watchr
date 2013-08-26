# .watchr script based on the script from http://www.rubyinside.com/how-to-rails-3-and-rspec-2-4336.html

def run_spec(file)
  check file
  puts "Running #{file}"
  system "bundle exec rspec #{file}"
  puts
end

def run_cuke(file)
  check file
  puts "Running #{file}"
  system "bundle exec cucumber #{file}"
  puts
end

def check(file)
  unless File.exist? file
    puts "#{file} does not exist"
    return
  end
end

watch("spec/.*/*_spec.rb") do |match|
  run_spec match[0]
end

watch("features/.*/*.feature") do |match|
  run_cuke match[0]
end

watch("app/(.*/.*).rb") do |match|
  run_spec %{spec/#{match[1]}_spec.rb}
end
