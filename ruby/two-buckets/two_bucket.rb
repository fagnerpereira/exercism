class Bucket
  attr_accessor :capacity, :usage, :name

  def initialize(capacity, name)
    @name = name
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

  def reached?(goal)
    usage == goal
  end
end

class TwoBucket
  attr_reader :moves

  def initialize(bucket_one_size, bucket_two_size, goal, start_bucket)
    @bucket_one, @bucket_two = initialize_buckets(bucket_one_size, bucket_two_size, start_bucket)
    @goal = goal
    @moves = 0

    solve!
  end

  def initialize_buckets(bucket_one_size, bucket_two_size, start_bucket)
    if start_bucket == 'one'
      [Bucket.new(bucket_one_size, 'one'), Bucket.new(bucket_two_size, 'two')]
    else
      [Bucket.new(bucket_two_size, 'two'), Bucket.new(bucket_one_size, 'one')]
    end
  end

  def solve!
    loop do
      break if goal_bucket

      perform_move
    end
  end

  def perform_move
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

    @moves += 1
  end

  def goal_bucket
    return @bucket_one.name if @bucket_one.reached?(@goal)

    @bucket_two.name if @bucket_two.reached?(@goal)
  end

  def other_bucket
    return @bucket_one.usage if @bucket_two.reached?(@goal)

    @bucket_two.usage if @bucket_one.reached?(@goal)
  end
end
