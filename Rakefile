task :default => :test

task :test do
	FileList["test/*_test.rb"].each do |test_file|
		sh "ruby -I lib #{test_file}"
	end
end