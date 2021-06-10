require 'FileUtils'

if ARGV.length < 1
	puts "User must input a folder directory."
	exit
end

folder_path = ARGV[0] + "\\"

Dir.foreach(folder_path, encoding: Encoding::UTF_8) do |filename|
# Skip current and parent directories.
	next if filename == '.' or filename == '..'
	File.write(".\\EFMFM_merged_file.md", (File.read(folder_path + filename) + "\n"), mode: 'a')
end