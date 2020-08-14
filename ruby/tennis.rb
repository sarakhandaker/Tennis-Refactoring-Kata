require 'pry'
class TennisGame1

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end
        
  def won_point(playerName)
    playerName == "player1"? @p1points += 1 : @p2points += 1
  end
  
  def score
    result = ""
    tempScore=0
    if (@p1points==@p2points)
      equal_score_names = ["Love-All", "Fifteen-All", "Thirty-All"]
       return equal_score_names[@p1points] || "Deuce"
    elsif (@p1points>=4 or @p2points>=4)
      minusResult = @p1points-@p2points
      if (minusResult==1)
        return "Advantage player1"
      elsif (minusResult ==-1)
        return "Advantage player2"
      elsif (minusResult>=2)
        return "Win for player1"
      else
        return "Win for player2"
      end
    else
      (1...3).each do |i|
        if (i==1)
          tempScore = @p1points
        else
          result+="-"
          tempScore = @p2points
        end
        result += {
            0 => "Love",
            1 => "Fifteen",
            2 => "Thirty",
            3 => "Forty",
        }[tempScore]
      end
    end
    result
  end
end

class TennisGame2
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end
      
  def won_point(playerName)
    playerName == @player1Name ? p1Score() : p2Score()
  end

  def p1Score
    @p1points +=1
  end
  
  def p2Score
    @p2points +=1
  end

  def score
    result = ""
    tennis_terms=["Love", "Fifteen", "Thirty", "Forty"]
    if (@p1points == @p2points and @p1points < 3)
        result = tennis_terms[@p1points]
        result += "-All"
    end
    if (@p1points==@p2points and @p1points>2)
        result = "Deuce"
    end
    p1res = ""
    p2res = ""
    if (@p1points > 0 and @p2points==0)
      p1res = tennis_terms[@p1points] || @p1points.to_s
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2points > 0 and @p1points==0)
      p2res = tennis_terms[@p2points] || @p2points.to_s
      p1res = "Love"
      result = p1res + "-" + p2res
    end
    
    if (@p1points>@p2points and @p1points < 4)
        p1res= tennis_terms[@p1points]
        p2res="Fifteen" if (@p2points==1)
        p2res="Thirty" if (@p2points==2)
      result = p1res + "-" + p2res
    end
    if (@p2points>@p1points and @p2points < 4)
        p2res = tennis_terms[@p2points]
        p1res= tennis_terms[@p1points]
      result = p1res + "-" + p2res
    end
    if (@p1points > @p2points and @p2points >= 3)
      result = "Advantage " + @player1Name
    end
    if (@p2points > @p1points and @p1points >= 3)
      result = "Advantage " + @player2Name
    end
    if (@p1points>=4 and @p2points>=0 and (@p1points-@p2points)>=2)
      result = "Win for " + @player1Name
    end
    if (@p2points>=4 and @p1points>=0 and (@p2points-@p1points)>=2)
      result = "Win for " + @player2Name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

end

class TennisGame3
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @player1Points = 0
    @player2Points = 0
  end
      
  def won_point(player)
    player == @player1Name? @player1Points += 1 : @player2Points += 1
  end
  
  def score
    if (@player1Points < 4 and @player2Points < 4) and (@player1Points + @player2Points < 6)
      tennis_name = ["Love", "Fifteen", "Thirty", "Forty"]
      score_player1 = tennis_name[@player1Points]
      score_player2= tennis_name[@player2Points]
      @player1Points == @player2Points ? score_player1 + "-All" : score_player1 + "-" + score_player2
    else
      if (@player1Points == @player2Points)
        "Deuce"
      else
        player = @player1Points > @player2Points ? @player1Name : @player2Name
        (@player1Points-@player2Points)*(@player1Points-@player2Points) == 1 ? "Advantage " + player : "Win for " + player
      end
    end
  end
end