class Bucket
  attr_accessor :capacity, :usage

  def initialize(capacity)
    @capacity = capacity
    @usage = 0
  end

  def fillup!
    @usage = @capacity
  end

  def clear!
    @usage = 0
  end

  def pour!(other)
    amount = [@usage, other.free].min

    other.usage += amount
    @usage -= amount
  end

  def free
    capacity - usage
  end

  def empty?
    usage.zero?
  end

  def full?
    usage == capacity
  end
end

class TwoBucket
  attr_reader :moves

  def initialize(bucket_one_size, bucket_two_size, goal, start_bucket)
    @bucket_one = Bucket.new(bucket_one_size)
    @bucket_two = Bucket.new(bucket_two_size)
    @goal = goal
    @start_bucket = start_bucket
    @moves = 0

    run
  end

  def run
    return if @bucket_one.usage == @goal || @bucket_two.usage == @goal

    @moves += 1
    if @start_bucket == 'one'
      if @bucket_one.empty?
        @bucket_one.fillup!
      elsif @bucket_two.free.positive?
        if @goal == @bucket_two.capacity
          @bucket_two.fillup!
        else
          @bucket_one.pour!(@bucket_two)
        end
      else
        @bucket_two.clear!
      end
    else
      if @bucket_two.empty?
        @bucket_two.fillup!
      elsif @bucket_one.free.positive?
        if @goal == @bucket_one.capacity
          @bucket_one.fillup!
        else
          @bucket_two.pour!(@bucket_one)
        end
      else
        @bucket_one.clear!
      end
    end

    run
  end

  def goal_bucket
    @goal == @bucket_one.usage ? 'one' : 'two'
  end

  def other_bucket
    @goal == @bucket_one.usage ? @bucket_two.usage : @bucket_one.usage
  end
end
