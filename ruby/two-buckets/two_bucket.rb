class TwoBucket
  attr_reader :moves

  def initialize(bucket_one_size, bucket_two_size, goal, start_bucket)
    @bucket_one = { capacity: bucket_one_size, usage: 0, free: bucket_one_size }
    @bucket_two = { capacity: bucket_two_size, usage: 0, free: bucket_two_size }
    @goal = goal
    @start_bucket = start_bucket
    @moves = 0

    run
  end

  def run
    return if @bucket_one[:usage] == @goal || @bucket_two[:usage] == @goal

    if @start_bucket == 'one'
      if @bucket_one[:usage].zero?
        fillup_bucket_one
      elsif @bucket_two[:free].positive?
        if @goal == @bucket_two[:capacity]
          fillup_bucket_two
        else
          pour_bucket_one_to_bucket_two
        end
      else
        clear_bucket_two
      end
    else
      if @bucket_two[:usage].zero?
        fillup_bucket_two
      elsif @bucket_one[:free].positive?
        if @goal == @bucket_one[:capacity]
          fillup_bucket_one
        else
          pour_bucket_two_to_bucket_one
        end
      else
        clear_bucket_one
      end
    end

    run
  end

  def goal_bucket
    @goal == @bucket_one[:usage] ? 'one' : 'two'
  end

  def other_bucket
    @goal == @bucket_one[:usage] ? @bucket_two[:usage] : @bucket_one[:usage]
  end

  def pour_bucket_one_to_bucket_two
    amount = [@bucket_one[:usage], @bucket_two[:free]].min

    @bucket_two[:usage] += amount
    @bucket_two[:free] -= amount
    @bucket_one[:usage] -= amount
    @bucket_one[:free] += amount
    @moves += 1
  end

  def pour_bucket_two_to_bucket_one
    amount = [@bucket_two[:usage], @bucket_one[:free]].min

    @bucket_one[:usage] += amount
    @bucket_one[:free] -= amount
    @bucket_two[:usage] -= amount
    @bucket_two[:free] += amount
    @moves += 1
  end

  def fillup_bucket_one
    @bucket_one[:usage] = @bucket_one[:capacity]
    @bucket_one[:free] = 0
    @moves += 1
  end

  def fillup_bucket_two
    @bucket_two[:usage] = @bucket_two[:capacity]
    @bucket_two[:free] = 0
    @moves += 1
  end

  def clear_bucket_one
    @bucket_one[:usage] = 0
    @bucket_one[:free] = @bucket_one[:capacity]
    @moves += 1
  end

  def clear_bucket_two
    @bucket_two[:usage] = 0
    @bucket_two[:free] = @bucket_two[:capacity]
    @moves += 1
  end
end
