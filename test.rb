# Function to find and print URLs in a file
def find_and_print_urls(file_path)
  
  pattern = %r{(https://www\.|http://www\.|https://|http://)[a-zA-Z0-9\d-]{1,}\.[a-zA-Z0-9\d-]{1,}\.[a-zA-Z0-9\d-]{1,}(\.[a-zA-Z0-9\d-]{1,})?(/[a-zA-Z0-9\d-]{1,})*|(https://www\.|http://www\.|https://|http://)[a-zA-Z\d-]{2,}(\.[a-zA-Z\d-]{2,})(\.[a-zA-Z\d-]{2,})?(/[a-zA-Z0-9\d-]{2,})*|((https://www\.|http://www\.|https://|http://)[a-zA-Z\d-]{2,}(\.[a-zA-Z\d-]{2,})(\.[a-zA-Z\d-]{2,})?)}i

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


# test cases
# test case 1 - invalid url
# Visit our website at https://www.example.com
# Check out our blog: http://blog.example.com
# Invalid URL: ftp://invalid-url.com  - fixed code for thid case 

#case 2 -path
# Website: https://www.example.com/home
# API Endpoint: https://api.example.com/v1/data 
# - after adding "*" to path , code worked rightly as expected

# case 3 -subdomain

# Main Domain: https://example.com
# Subdomain 1: https://sub1.example.com
# Subdomain 2: http://sub2.example.com/page  - worked properly


# case 4 - ipdomain
# Visit us at http://192.168.1.1
# Server IP: https://203.0.113.42/api - added additional digit support


