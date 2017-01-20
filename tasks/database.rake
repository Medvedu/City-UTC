# encoding: utf-8
# frozen_string_literal: true
desc 'Restores database'
task :restore_database! do
  path_to_folder = File.join(__dir__, "..", "sources", "database")
  path_to_database = File.join(path_to_folder, 'sqlite.db.gz')
  Kernel.system "gzip -d #{path_to_database} #{path_to_folder}"
end

desc 'Compresses database'
task :compress_database! do
  path_to_folder = File.join(__dir__, "..", "sources", "database")
  path_to_database = File.join(path_to_folder, 'sqlite.db')
  Kernel.system "gzip -k #{path_to_database} #{path_to_folder}"
end
