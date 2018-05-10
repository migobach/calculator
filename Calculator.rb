
# --------- Selection 3 ----------------

@arr_results = []
@regrexnumber = /^\d+(\.\d+)?$/
@regexmath = /[\p{S}]/ #only my + works as a modifier - even if I change them .to_s

# --------- Menu ----------------

  def menu
    puts "------Calculator----"
    puts "Welcome to the calculator!"
    puts "Please select an option:"
    puts "\t1) Enter numbers and modifier"
    puts "\t2) Enter a string input"
    puts "\t3) View the calculations you have preformed"
    puts "\t4) Exit"
    main_menu
  end

# --------- selection 1 ----------------

 def first_number
    puts "If you would like to clear your work, type 'clear' at any time."
    puts "Enter your first number:"
    @first_number = gets.strip
      if @first_number.match(@regrexnumber)
        @first_number = @user_number.to_i
        puts "Thank you"
        modifier
      elsif @first_number == "exit"
          first_number
      else
        puts "Not a number, try again:"
        first_number
      end
  end

def modifier
    puts "Enter your modifier:"
    @modifier = gets.strip
    @modifier = @modifier
        if @modifier.match(@regexmath)
          second_number
        elsif
          @modifier == "exit"
          first_number
        else
          puts "Not a modifier, try again:"
          modifier
        end
end


def second_number
    puts "Enter your second number:"
    @second_number = gets.strip
      if @second_number.match(@regrexnumber)
        @second_number = @second_number.to_i
        equation
      elsif
        @second_number == "exit"
        first_number
      else
        puts "Not a number, try again:"
        second_number
      end
end



def equation
    puts "Your equation is: #{@first_number.to_i} #{@modifier.to_s} #{@second_number.to_i}"
    result = @first_number.to_i.public_send(@modifier.to_s, @second_number.to_i)
    puts "The result is: #{result}"
    @arr_results << {first_number: @first_number, modifier: @modifier, second_number: @second_number, result: result}
end

# --------- selection 2 ----------------

# look at the .scan method was the recommendation - still need to do that.

  def single_input_calc
    puts "What would you like to calculate? - enter first number then operator then second number."
    to_calc = gets.strip
    arr = to_calc.split
    first_num = arr[0].to_i
    op = arr[1].to_s
    second_num = arr[2].to_i
    string_result = first_num.public_send(op, second_num)
    puts "The result is: #{string_result}"
    @arr_results << {first_number: first_num, modifier: op, second_number: second_num, result: string_result}
  end


# --------- Menu ----------------

def main_menu
    option = gets.strip.to_i
  case option
    when 1
      puts "You chose option 1"
      first_number
    when 2
      puts "You chose option 2"
      single_input_calc
    when 3
      puts "You chose option 3"
      puts @arr_results # I really want the output to not be the hashes, I want it to be a nice, clean string, but how?
    when 4
      puts "Goodbye!"
      exit
    else
      puts "Try again!"
  end
  menu
end

menu


# matches_regex ? go_calc : error_message <-- this is a ternery, use this when tryng to do one thing.
