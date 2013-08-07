class Song
  include Enumerable

  def initialize *sonorites
    @sonorities = sonorites
  end

  def each
    unless block_given?
      @sonorites.each
    else
      # let's write it
    end
  end
end

Song.new(Bnat.sharp.sharp.flat, Cnat.double_sharp, Dflat.sharp, Dnat.double_flat, Aflat, Cnat, Eflat, Gnat.flat.flat)
