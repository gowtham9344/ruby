# Function to find and print URLs in a file
def find_and_print_urls(file_path)
  
  pattern = %r{(https://www\.|http://www\.|https://|http://)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?/[a-zA-Z0-9]{2,}|((https://www\.|http://www\.|https://|http://)?[a-zA-Z]{2,}(\.[a-zA-Z]{2,})(\.[a-zA-Z]{2,})?)|(https://www\.|http://www\.|https://|http://)?[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}\.[a-zA-Z0-9]{2,}(\.[a-zA-Z0-9]{2,})?}i

  File.open(file_path, "r") do |file|
      matches = []
      file.each_line do |line|
        while (match = line.match(pattern))
          matches << match[0]
          line = match.post_match
        end
      end
      puts "URLs\n#{matches.join("\n")}" 
  end
end

find_and_print_urls("output.txt")
