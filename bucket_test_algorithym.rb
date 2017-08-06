# 15 Roses

# 10 < 15
# 	15-10 = 5 

#   10 < 5 
# else
#   5 => 5
#		5-5 =0	 
#   

rose_count = 27
buckets = {
	10 => 0,
	5 => 0
}
bucket_sizes = buckets.keys

buckets_high_to_low = bucket_sizes.sort.reverse

while rose_count > 0
	buckets_high_to_low.each do |bucket_size|
		puts "Rose Count: #{rose_count}"
		puts "Bucket Size: #{bucket_size}"

		while rose_count >= bucket_size
			puts "rose_count > bucket_size"

			if bucket_size < rose_count
				puts "bucket_size < rose_count"
				buckets[bucket_size] += 1
				rose_count -= bucket_size
			elsif bucket_size >= rose_count
				puts "bucket_size >= rose_count"
				buckets[bucket_size] += 1
				rose_count -= bucket_size
			else
				break
			end
		end
	end

	puts buckets.inspect
	puts "Left over roses: #{rose_count}"

	break
	# rose_count -= someval
	# rose_count = 0
end