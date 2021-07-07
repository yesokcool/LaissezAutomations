require 'FileUtils'

if ARGV.length < 1
	puts "User must input a file path."
	exit
end

file_path = ARGV[0]
timestamp = ARGV[1] unless ARGV[1].to_i == 0
chat_type = ARGV[2] unless ARGV[2].to_i == 0

IO.write(".\\ExtractedLog.txt", "", mode: 'w')

IO.foreach(file_path) do |line| 
	cleaned_line = ""
	# 00 at beginning might have to be left out?
	if line =~ /00\|(\d{4}\-\d{2}\-\d{2}).(\d{2}\:\d{2}\:\d{2})\..*\-\d{2}\:\d{2}\|(\w{4})\|(\S*\s\S*)\|(.*)\|/
		puts "matched!"
		if !timestamp.nil?
			cleaned_line += "(" + $1 + $2 + ") | "
		end

		if chat_type.nil?
			case $3
				when "000c"
					cleaned_line += ">> " + $4 + ": " + $5
				when "000d"
					cleaned_line += $4 + " >> " + $5
			else
				cleaned_line += $4 + ": " + $5
			end
		else			
			case $3
				when "000a" # Say
					cleaned_line += "(SAY) " + $4 + ": " + $5
				when "000b" # Shout
					cleaned_line += "(SHOUT) " + $4 + ": " + $5
				when "000c" # Tell sent / received?
					cleaned_line += "(TELL) " + ">> " + $4 + ": " + $5
				when "000d"
					cleaned_line += "(TELL) " + $4 + " >> " + $5
				when "000e" # Party
					cleaned_line += "(PARTY) " + $4 + ": " + $5
				when "000f" # Alliance
					cleaned_line += "(ALLIANCE) " + $4 + ": " + $5
				when "001e" # Yell
					cleaned_line += "(YELL) " + $4 + ": " + $5
				when "001c", "001d" # custom emote, others / self?
					cleaned_line += "(CEMOTE) " + $4 + ": " + $5
				when "0018" # FC
					cleaned_line += "(FC) " + $4 + ": " + $5
				when "0010","0011","0012","0013","0014","0015","0016","0017", 
					cleaned_line += "(LINKSHELL) " + $4 + ": " + $5
				# Shotgunning where I think Crossworld Linkshells are
				when "0060","0061","0062","0063","0064","0065","0066","0067","0068","0069",
						"0070","0071","0072"
					cleaned_line += "(CWLINKSHELL) " + $4 + ": " + $5
				else 
					cleaned_line += "(OTHER) " + $4 + ": " + $5
			end
		end

		puts cleaned_line
		IO.write(".\\ExtractedLog.txt", (cleaned_line + "\n"), mode: 'a')
	end
end