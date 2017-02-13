class ElectoralCollege
  public
    def calculate_winning_temperature(electorate)
      return winning_temperature(collect_temperatures(electorate))
    end

  private
    def collect_temperatures(electorate)
      temperatures = Array.new

      electorate.each do |voter|
        case voter.category
          when "SM"
            next
          when "RM"
            temperatures.clear
            temperatures.push(voter.desired_AC_temperature)
            break
        else
            temperatures.push(voter.desired_AC_temperature)
        end
      end

      return temperatures
    end

    def winning_temperature(temps)
      winners = Array.new
      winner_count = 0

      for i in 17..28
        current_count = temps.count(i)
        if current_count > winner_count
          winner_count = current_count
          winners.clear
          winners.push(i)
        elsif current_count == winner_count
          winners.push(i)
        end
      end

      winner = 0
      if winners.size == 1
        winner = winners[0]
      else
        sum = 0
        winners.each do |winner|
          sum = sum + winner
        end
        winner =  sum / winners.size
      end

      return winner
    end
end
