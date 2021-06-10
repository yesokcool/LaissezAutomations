require 'FileUtils'

if ARGV.length < 1
	puts "User must input a folder directory."
	exit
end


if (ARGV.length == 2)
	separator = ARGV[1]
else
	separator = ""
end

folder_path = ARGV[0] + "\\"

File.write(".\\EFMFM_merged_file.md", "", mode:'w')

Dir.foreach(folder_path, encoding: Encoding::UTF_8) do |filename|
# Skip current and parent directories.
	next if filename == '.' or filename == '..'
	File.write(".\\EFMFM_merged_file.md", (File.read(folder_path + filename) + "\n\n" + separator + "\n\n"), mode: 'a')
end