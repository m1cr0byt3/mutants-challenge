class MutantService
  
  MAXIM_COINCIDENCE = 4
  LIMIT_SEQUENCE = 1
  MOVES = ['horizontal', 'vertical', 'left', 'right']

  def initialize dna_sequence 
      @dna_sequence = dna_sequence
  end

    def self.run dna
      machine = self.new dna
      machine.is_mutant
    end
  
    def  is_mutant
      @has_sequence = 0
      check_forms
      @has_sequence > LIMIT_SEQUENCE
  end

  private 

  def check_forms
      @dna_sequence.each_with_index do |dna, idx_|
          dna.split('').each_with_index do |dna_segment, idx_letter|
              segment_idx = [idx_, idx_letter]
              check_segment(dna_segment, segment_idx)          
          end
      end
  end

  def check_segment dna_segment, segment_idx       
      MOVES.each do |next_segment|
          @has_coincidence = 1
          compare_segment(next_segment, dna_segment, segment_idx)
      end
  end

  def compare_segment kind, dna_segment, segment_idx
      next_idx    =   next_position(segment_idx, kind)

      if coincidence(dna_segment, next_idx) 
          compare_segment(kind, dna_segment, next_idx)
          @has_coincidence += 1
          @has_sequence += 1 if @has_coincidence == (MAXIM_COINCIDENCE) 
      end
  end

  def next_position segment_idx, kind
      axis_x   = segment_idx[0]
      axis_y   = segment_idx[1]

      case kind
      when 'horizontal'
        axis_x += 1
      when 'vertical'
        axis_y += 1
      when 'left'
        axis_x -= 1
        axis_y += 1
      else
        axis_x += 1
        axis_y += 1
      end
      [axis_x, axis_y]       
  end

  def coincidence dna_segment, position
      next_dna_segment = @dna_sequence[position[0]]
      ((next_dna_segment.nil?)? false : (dna_segment == next_dna_segment.split('')[position[1]]))
  end
end
