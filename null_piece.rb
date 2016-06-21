require 'singleton'

class NullPiece
  include Singleton

  def initialize

  end

  def to_s
    "   "
  end
end
