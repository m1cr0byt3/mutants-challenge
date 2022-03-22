class StatService

    def self.stats
        records_dna = Mutant.all
        count_mutant_dna = records_dna.select {|s| s.is_mutant}.size
        count_human_dna = records_dna.select {|s| !s.is_mutant}.size
        ratio = (count_mutant_dna.to_f/count_human_dna.to_f).round(2)
        { :adn => {count_mutant_dna:count_mutant_dna,count_human_dna:count_human_dna,ratio: ratio }}
    end
end