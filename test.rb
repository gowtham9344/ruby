# Function to find and print URLs in a file
def find_and_print_urls(file_path)
  
  url_regex = %r{(((https://)|(www.)|(http://))(\S+))}


  File.open(file_path, "r") do |file|
      matches = []
      file.each_line do |line|
        while (match = line.match(url_regex))
          matches << match[0]
          line = match.post_match
        end 
      end
      puts "URLs\n#{matches.join("\n")}" 
  end
end

find_and_print_urls("output.txt")
