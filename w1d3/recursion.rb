# def range(start,last)
#   diff = last - start
#   if diff < 2
#     return []
#   else
#     return range(start, last -1) + [last -1]
#   end
# end
#
# def recursive_sum(array)
#   return array.first if array.length <= 1
#   array.pop + recursive_sum(array)
# end
#
# def iterative_sum(array)
#   array.inject(:+)
# end
#
# # Write two versions of exponent that use two different recursions:
# def exp_v1(base, power)
#   return 1 if power <= 0
#   base * exp_v1(base, power - 1)
# end
#
# def exp_v2(base, power)
#   return 1 if power <= 0
#   return base if power == 1
#
#   if power.even?
#     smaller_exponent = power/2
#     exp_v2(base, smaller_exponent) ** 2
#   else
#     smaller_exponent = (power - 1)/2
#     base * (exp_v2(base, smaller_exponent) ** 2)
#   end
# end

# class Array
#   def deep_dup
#       new_arr = []
#       self.each do |el|
#         if !el.is_a?(Array)
#           new_arr << el
#         else
#           new_arr << el.deep_dup
#         end
#       end
#     new_arr
#   end
# end


# # 1,1,2,3,5,8,13,21,34,55,89,144
# #rec_fib(0) => [1]
# #rec_fib(1) => [1,1]
# #start recursing
# #rec_fib(2) => [1,1,2]
#
#
# def rec_fib(num)
#   return [] if num < 0
#   return [1] if num.zero?
#   return [1,1] if num == 1
#
#   prev_fib = rec_fib(num -1)
#   prev_fib + [prev_fib[-2] + prev_fib[-1]]
#   #new_arr
# end

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# subsets([1, 2, 3, 4])
# => [[], [1], [2], [1, 2],
# [3], [1, 3], [2, 3], [1, 2, 3],
# [4], [1, 4], [2, 4], [1, 2, 4]],
# [3, 4], [2, 3, 4]],
# [1, 2, 3, 4]]

# def subsets(arr)
#   return [arr] if arr.length <1
#   return [[], arr] if arr.length == 1
#   new_arr = []
#   new_arr << arr
#   arr.each_with_index do |el, idx|
#     new_arr += subsets(arr[0...idx] + arr[(idx+1)..-1])
#   end
#   new_arr.uniq
# end

# # permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
# #                         #     [2, 1, 3], [2, 3, 1],
# #                         #     [3, 2, 1], [3, 1, 2]]
# #
# # =>
# # [permutations([1, 2]) + 3] +
# # [permutations([1, 3]) + 2] +
# # [permutations([2, 3]) + 1]
# #
# # permutations([1, 2, 3, 4])
# # =>
# # [permutations([1, 2, 3]) + 4] +
# # [permutations([1, 3, 4]) + 3] +
# # [permutations([2, 3, 4]) + 2] +
# # [permutations([1, 2, 4]) + 1]
#
#
# def permutations(arr)
#   return [[arr[0], arr[1]], [arr[1], arr[0]]] if arr.length == 2
#   new_arr = []
#   arr.each_with_index do |el, idx|
#     # new_arr += permutations(arr[0...idx] + arr[(idx+1)..-1]).map {|item| item +[el]}
#     drop_el = arr[0...idx] + arr[(idx+1)..-1]
#     new_arr += permutations(drop_el).map {|item| item +[el]}
#   end
#   new_arr
# end
#
# #
# # bsearch([1, 2, 3], 1) # => 0
# # bsearch([2, 3, 4, 5], 3) # => 1
# # bsearch([2, 4, 6, 8, 10], 6) # => 2
# # bsearch([1, 3, 4, 5, 9], 5) # => 3
# # bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# # bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# # bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
#
# def bsearch(arr, target)
#   midx = arr.length/2
#   return nil if arr.length <1
#   return midx if arr[midx] == target
#
#   left_arr = arr[0...midx]
#   right_arr = arr[midx+1 .. -1]
#
#   if arr[midx] > target
#     bsearch(left_arr, target)
#
#   elsif arr[midx] < target
#     result = bsearch(right_arr, target)
#     if result
#       left_arr.length + result
#     else
#       return nil
#     end
#
#   end
# end

# def merge_sort(arr)
#   return arr if arr.length <= 1
#   midx = arr.length/2
#   arr1 = merge_sort(arr[0...midx])
#   arr2 = merge_sort(arr[midx..-1])
#   merge(arr1, arr2)
# end
#
# require "byebug"
# def merge(arr1, arr2)
#   new_arr = []
#   idx1 = 0
#   idx2 = 0
#   while idx1 <= arr1.length && idx2 <= arr2.length
#
#       if idx1 == arr1.length
#         new_arr += arr2[idx2..-1]
#         break
#       elsif idx2 == arr2.length
#         new_arr += arr1[idx1..-1]
#         break
#
#       elsif arr1[idx1] <= arr2[idx2]
#         new_arr << arr1[idx1]
#         idx1 +=1
#
#       elsif arr1[idx1] > arr2[idx2]
#         new_arr << arr2[idx2]
#         idx2 +=1
#       end
#   end
#   new_arr
# end




# greedy_make_change(24, [10,7,1]) => [10, 10, 1, 1, 1, 1]
# greedy_make_change(24, [25, 10, 5, 1]) => [10, 10, 1, 1, 1, 1]
# greedy_make_change(5, [25, 10, 5, 1]) => [5]
#
# greedy_make_change(6, [25, 10, 5, 1]) => [5, 1]
# => greedy_make_change(amount - largest_coin) + [largest_coin]
# => greedy_make_change(amount - 5) + [5]
#
# greedy_make_change(26, [25, 10, 5, 1]) => [25, 1]
# => greedy_make_change(amount - largest_coin) + largest_coin
# => greedy_make_change(amount - 25) + 25

#   this works!!!
# def greedy_make_change(amount, coins = [25, 10, 5, 1])
#   return [amount] if coins.include?(amount)
#   largest_coin = find_largest_coin(amount, coins)
#   greedy_make_change((amount - largest_coin), coins) + [largest_coin]
# end




#make it better

# def make_change(amount, coins = [25, 10, 5, 1])
#   return [amount] if coins.include?(amount)
#   next_coin = div(amount,coins) || find_largest_coin(amount, coins)
#   [next_coin] + make_change((amount - next_coin), coins)
# end
#
# def find_largest_coin(amount, coins = [25, 10, 5, 1])
#   coins.each do |coin|
#     return coin if coin <= amount
#   end
# end
#
# def div(amount, coins = [25, 10, 5, 1])
#   coins.each do |coin|
#     return coin if (amount%coin == 0) && (coin != 1)
#   end
#   return nil
# end
